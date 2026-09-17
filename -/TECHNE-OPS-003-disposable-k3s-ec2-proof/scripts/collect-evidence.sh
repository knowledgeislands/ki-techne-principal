#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
proof_root=$(cd -- "$script_dir/.." && pwd)
results_dir="$proof_root/results"

profile=knowledge-islands-techne
region=eu-west-1

export AWS_PAGER=

get_command_status() {
  local command_id=$1
  local instance_id=$2
  local command_result

  if ! command_result=$(aws ssm get-command-invocation \
    --profile "$profile" \
    --region "$region" \
    --command-id "$command_id" \
    --instance-id "$instance_id" \
    --query Status \
    --output text 2>&1); then
    if [[ "$command_result" == *InvocationDoesNotExist* ]]; then
      printf 'Pending'
      return 0
    fi
    printf '%s\n' "$command_result" >&2
    return 1
  fi
  printf '%s' "$command_result"
}

inventory_path="$results_dir/inventory.json"
if [[ ! -f "$inventory_path" ]]; then
  printf 'Missing inventory evidence: %s\n' "$inventory_path" >&2
  exit 1
fi

instance_id=$(jq -r .outputs.InstanceId "$inventory_path")
collection_command=$(printf '%s\n' \
  'set -eu' \
  "printf 'K3S_VERSION=%s\\n' \"\$(/usr/local/bin/k3s --version | head -n 1)\"" \
  "printf 'JOB_SUCCEEDED=%s\\n' \"\$(/usr/local/bin/k3s kubectl -n ki-proof get job ki-proof -o jsonpath='{.status.succeeded}')\"" \
  "printf 'POD_PHASE=%s\\n' \"\$(/usr/local/bin/k3s kubectl -n ki-proof get pods -l app.kubernetes.io/name=ki-proof -o jsonpath='{.items[0].status.phase}')\"" \
  "printf 'IMAGE_ID=%s\\n' \"\$(/usr/local/bin/k3s kubectl -n ki-proof get pods -l app.kubernetes.io/name=ki-proof -o jsonpath='{.items[0].status.containerStatuses[0].imageID}')\"" \
  "printf 'OUTCOME_JSON=%s\\n' \"\$(/usr/local/bin/k3s kubectl -n ki-proof logs job/ki-proof)\"")

parameters=$(jq -cn --arg command "$collection_command" '{commands:[$command]}')
command_id=$(aws ssm send-command \
  --profile "$profile" \
  --region "$region" \
  --instance-ids "$instance_id" \
  --document-name AWS-RunShellScript \
  --comment 'TECHNE-OPS-003 collect proof evidence' \
  --parameters "$parameters" \
  --query Command.CommandId \
  --output text)

command_status=Pending
for _ in $(seq 1 120); do
  command_status=$(get_command_status "$command_id" "$instance_id")
  case "$command_status" in
    Success)
      break
      ;;
    Cancelled|Cancelling|Failed|TimedOut)
      break
      ;;
  esac
  sleep 5
done

aws ssm get-command-invocation \
  --profile "$profile" \
  --region "$region" \
  --command-id "$command_id" \
  --instance-id "$instance_id" \
  --output json >"$results_dir/collection-invocation.json"

if [[ "$command_status" != "Success" ]]; then
  printf 'Evidence collection failed with status %s\n' "$command_status" >&2
  exit 1
fi

collection_output=$(jq -r .StandardOutputContent "$results_dir/collection-invocation.json")
k3s_version=$(printf '%s\n' "$collection_output" | sed -n 's/^K3S_VERSION=//p')
job_succeeded=$(printf '%s\n' "$collection_output" | sed -n 's/^JOB_SUCCEEDED=//p')
pod_phase=$(printf '%s\n' "$collection_output" | sed -n 's/^POD_PHASE=//p')
image_id=$(printf '%s\n' "$collection_output" | sed -n 's/^IMAGE_ID=//p')
outcome_json=$(printf '%s\n' "$collection_output" | sed -n 's/^OUTCOME_JSON=//p')

if [[ "$job_succeeded" != "1" || "$pod_phase" != "Succeeded" ]]; then
  printf 'Unexpected Kubernetes outcome: succeeded=%s phase=%s\n' "$job_succeeded" "$pod_phase" >&2
  exit 1
fi
printf '%s' "$outcome_json" | jq -e '.status == "completed" and .metadata_access == "blocked"' >/dev/null

manifest_hashes=$(
  for manifest in "$proof_root"/manifests/*.yaml; do
    digest=$(shasum -a 256 "$manifest" | awk '{print $1}')
    jq -cn --arg file "$(basename "$manifest")" --arg sha256 "$digest" '{file:$file,sha256:$sha256}'
  done | jq -s .
)

jq -n \
  --arg completed_at "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  --arg image_id "$image_id" \
  --arg job_succeeded "$job_succeeded" \
  --arg k3s_version "$k3s_version" \
  --arg pod_phase "$pod_phase" \
  --argjson assignment "$(jq -c . "$proof_root/fixtures/assignment.json")" \
  --argjson inventory "$(jq -c . "$inventory_path")" \
  --argjson manifest_hashes "$manifest_hashes" \
  --argjson outcome "$outcome_json" \
  --argjson target "$(jq -c . "$proof_root/fixtures/target.json")" \
  '{
    assignment: $assignment,
    completed_at: $completed_at,
    execution: {
      image_id: $image_id,
      job_succeeded: ($job_succeeded | tonumber),
      k3s_version: $k3s_version,
      outcome: $outcome,
      pod_phase: $pod_phase
    },
    infrastructure: $inventory,
    manifest_hashes: $manifest_hashes,
    schema_version: "proof-evidence-v0",
    target: $target,
    teardown: null,
    work_item: "TECHNE-OPS-003"
  }' >"$results_dir/evidence.json"

printf 'Collected proof evidence from instance %s\n' "$instance_id"
