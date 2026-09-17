#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
proof_root=$(cd -- "$script_dir/.." && pwd)
results_dir="$proof_root/results"

profile=knowledge-islands-techne
region=eu-west-1
work_item=TECHNE-OPS-003

export AWS_PAGER=
cleanup_required=true

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

cleanup() {
  exit_code=$?
  trap - EXIT INT TERM
  if [[ "$cleanup_required" == "true" ]]; then
    "$script_dir/destroy.sh" || cleanup_code=$?
    if [[ "${cleanup_code:-0}" -ne 0 && "$exit_code" -eq 0 ]]; then
      exit_code=$cleanup_code
    fi
  fi
  exit "$exit_code"
}
trap cleanup EXIT INT TERM

"$script_dir/provision.sh"

instance_id=$(jq -r .outputs.InstanceId "$results_dir/inventory.json")
namespace_payload=$(base64 <"$proof_root/manifests/namespace.yaml" | tr -d '\n')
namespaced_payload=$(
  cat "$proof_root/manifests/service-account.yaml" "$proof_root/manifests/network-policy.yaml" |
    base64 |
    tr -d '\n'
)
job_payload=$(base64 <"$proof_root/manifests/job.yaml" | tr -d '\n')

remote_command=$(printf '%s\n' \
  'set -eu' \
  'test -f /var/lib/ki-proof/ready' \
  "printf '%s' '$namespace_payload' | base64 -d >/var/lib/ki-proof/namespace.yaml" \
  "printf '%s' '$namespaced_payload' | base64 -d >/var/lib/ki-proof/namespaced.yaml" \
  "printf '%s' '$job_payload' | base64 -d >/var/lib/ki-proof/job.yaml" \
  '/usr/local/bin/k3s kubectl apply --dry-run=server -f /var/lib/ki-proof/namespace.yaml' \
  '/usr/local/bin/k3s kubectl apply -f /var/lib/ki-proof/namespace.yaml' \
  '/usr/local/bin/k3s kubectl apply --dry-run=server -f /var/lib/ki-proof/namespaced.yaml' \
  '/usr/local/bin/k3s kubectl apply -f /var/lib/ki-proof/namespaced.yaml' \
  '/usr/local/bin/k3s kubectl apply --dry-run=server -f /var/lib/ki-proof/job.yaml' \
  'sleep 5' \
  '/usr/local/bin/k3s kubectl -n ki-proof delete job ki-proof --ignore-not-found=true' \
  '/usr/local/bin/k3s kubectl apply -f /var/lib/ki-proof/job.yaml' \
  '/usr/local/bin/k3s kubectl -n ki-proof wait --for=condition=complete --timeout=300s job/ki-proof' \
  "printf '%s\\n' KI_PROOF_OUTCOME_BEGIN" \
  '/usr/local/bin/k3s kubectl -n ki-proof logs job/ki-proof' \
  "printf '%s\\n' KI_PROOF_OUTCOME_END")

parameters=$(jq -cn --arg command "$remote_command" '{commands:[$command]}')
command_id=$(aws ssm send-command \
  --profile "$profile" \
  --region "$region" \
  --instance-ids "$instance_id" \
  --document-name AWS-RunShellScript \
  --comment "$work_item run disposable workload" \
  --parameters "$parameters" \
  --query Command.CommandId \
  --output text)

command_status=Pending
for _ in $(seq 1 180); do
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
  --output json >"$results_dir/execution-invocation.json"

if [[ "$command_status" != "Success" ]]; then
  jq -r '.StandardErrorContent, .StandardOutputContent' "$results_dir/execution-invocation.json" >&2
  printf 'Proof workload failed with status %s\n' "$command_status" >&2
  exit 1
fi

"$script_dir/collect-evidence.sh"
"$script_dir/destroy.sh"
cleanup_required=false
trap - EXIT INT TERM

evidence_tmp=$(mktemp)
jq --slurpfile teardown "$results_dir/teardown.json" '.teardown = $teardown[0]' \
  "$results_dir/evidence.json" >"$evidence_tmp"
mv -- "$evidence_tmp" "$results_dir/evidence.json"

printf 'Proof completed and teardown verified\n'
