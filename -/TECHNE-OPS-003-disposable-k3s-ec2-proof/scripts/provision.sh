#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
proof_root=$(cd -- "$script_dir/.." && pwd)
results_dir="$proof_root/results"
template_path="$proof_root/cloudformation/stack.yaml"

profile=knowledge-islands-techne
region=eu-west-1
expected_account=655383751458
stack_name=ki-techne-ops-003-k3s-proof
work_item=TECHNE-OPS-003

export AWS_PAGER=
mkdir -p -- "$results_dir"

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

caller_account=$(aws sts get-caller-identity --profile "$profile" --query Account --output text)
if [[ "$caller_account" != "$expected_account" ]]; then
  printf 'Refusing AWS write: expected account %s, received %s\n' "$expected_account" "$caller_account" >&2
  exit 1
fi

configured_region=$(aws configure get region --profile "$profile")
if [[ "$configured_region" != "$region" ]]; then
  printf 'Refusing AWS write: expected region %s, received %s\n' "$region" "$configured_region" >&2
  exit 1
fi

if aws cloudformation describe-stacks --profile "$profile" --region "$region" --stack-name "$stack_name" >/dev/null 2>&1; then
  printf 'Refusing AWS write: stack %s already exists; run destroy.sh first\n' "$stack_name" >&2
  exit 1
fi

existing_vpcs=$(aws ec2 describe-vpcs --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Vpcs)' --output text)
existing_subnets=$(aws ec2 describe-subnets --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Subnets)' --output text)
existing_gateways=$(aws ec2 describe-internet-gateways --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(InternetGateways)' --output text)
existing_security_groups=$(aws ec2 describe-security-groups --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(SecurityGroups)' --output text)
existing_instances=$(aws ec2 describe-instances \
  --profile "$profile" \
  --region "$region" \
  --filters "Name=tag:ki-work-item,Values=$work_item" Name=instance-state-name,Values=pending,running,stopping,stopped,shutting-down \
  --query 'length(Reservations[].Instances[])' \
  --output text)
existing_volumes=$(aws ec2 describe-volumes --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Volumes)' --output text)
existing_total=$((existing_vpcs + existing_subnets + existing_gateways + existing_security_groups + existing_instances + existing_volumes))
if [[ "$existing_total" -ne 0 ]]; then
  printf 'Refusing AWS write: found %s active resources tagged %s\n' "$existing_total" "$work_item" >&2
  exit 1
fi

resolved_ami=$(aws ssm get-parameter \
  --profile "$profile" \
  --region "$region" \
  --name /aws/service/canonical/ubuntu/server/24.04/stable/current/amd64/hvm/ebs-gp3/ami-id \
  --query Parameter.Value \
  --output text)
if [[ "$resolved_ami" != "ami-0526a6499f6470118" ]]; then
  printf 'Refusing AWS write: planned AMI no longer current (%s)\n' "$resolved_ami" >&2
  exit 1
fi

aws cloudformation validate-template \
  --profile "$profile" \
  --region "$region" \
  --template-body "file://$template_path" \
  >/dev/null

proof_id="ops003-$(date -u +%Y%m%d%H%M%S)"
if expiry_at=$(date -u -v+2H +%Y-%m-%dT%H:%M:%SZ 2>/dev/null); then
  :
else
  expiry_at=$(date -u -d '+2 hours' +%Y-%m-%dT%H:%M:%SZ)
fi
started_at=$(date -u +%Y-%m-%dT%H:%M:%SZ)

aws cloudformation deploy \
  --profile "$profile" \
  --region "$region" \
  --stack-name "$stack_name" \
  --template-file "$template_path" \
  --capabilities CAPABILITY_IAM \
  --parameter-overrides \
    "ProofId=$proof_id" \
    "ExpiryAt=$expiry_at" \
  --tags \
    "ki-work-item=$work_item" \
    "ki-proof-id=$proof_id"

stack_json=$(aws cloudformation describe-stacks \
  --profile "$profile" \
  --region "$region" \
  --stack-name "$stack_name" \
  --output json)

outputs_json=$(printf '%s' "$stack_json" | jq '.Stacks[0].Outputs | map({key: .OutputKey, value: .OutputValue}) | from_entries')
instance_id=$(printf '%s' "$outputs_json" | jq -r .InstanceId)

jq -n \
  --arg account "$expected_account" \
  --arg expiry_at "$expiry_at" \
  --arg k3s_version 'v1.36.4+k3s1' \
  --arg image 'docker.io/library/busybox@sha256:73aaf090f3d85aa34ee199857f03fa3a95c8ede2ffd4cc2cdb5b94e566b11662' \
  --arg profile "$profile" \
  --arg proof_id "$proof_id" \
  --arg region "$region" \
  --arg stack_name "$stack_name" \
  --arg started_at "$started_at" \
  --argjson outputs "$outputs_json" \
  '{
    account: $account,
    expiry_at: $expiry_at,
    inputs: {
      ami: "ami-0526a6499f6470118",
      image: $image,
      instance_type: "t3.medium",
      k3s_version: $k3s_version,
      subnet_cidr: "10.88.0.0/25",
      vpc_cidr: "10.88.0.0/24"
    },
    outputs: $outputs,
    profile: $profile,
    proof_id: $proof_id,
    region: $region,
    stack_name: $stack_name,
    started_at: $started_at,
    status: "provisioned"
  }' >"$results_dir/inventory.json"

aws ec2 wait instance-status-ok \
  --profile "$profile" \
  --region "$region" \
  --instance-ids "$instance_id"

ssm_online=false
for _ in $(seq 1 120); do
  ping_status=$(aws ssm describe-instance-information \
    --profile "$profile" \
    --region "$region" \
    --filters "Key=InstanceIds,Values=$instance_id" \
    --query 'InstanceInformationList[0].PingStatus' \
    --output text)
  if [[ "$ping_status" == "Online" ]]; then
    ssm_online=true
    break
  fi
  sleep 5
done
if [[ "$ssm_online" != "true" ]]; then
  printf 'Instance %s did not become available through Systems Manager\n' "$instance_id" >&2
  exit 1
fi

ready_parameters=$(jq -cn '{commands:["for attempt in $(seq 1 120); do test -f /var/lib/ki-proof/ready && exit 0; sleep 5; done; exit 1"]}')
ready_command_id=$(aws ssm send-command \
  --profile "$profile" \
  --region "$region" \
  --instance-ids "$instance_id" \
  --document-name AWS-RunShellScript \
  --comment "$work_item wait for K3s readiness" \
  --parameters "$ready_parameters" \
  --query Command.CommandId \
  --output text)

ready_status=Pending
for _ in $(seq 1 180); do
  ready_status=$(get_command_status "$ready_command_id" "$instance_id")
  case "$ready_status" in
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
  --command-id "$ready_command_id" \
  --instance-id "$instance_id" \
  --output json >"$results_dir/readiness-invocation.json"

if [[ "$ready_status" != "Success" ]]; then
  printf 'K3s bootstrap readiness failed with status %s\n' "$ready_status" >&2
  exit 1
fi

inventory_tmp=$(mktemp)
jq --arg ready_at "$(date -u +%Y-%m-%dT%H:%M:%SZ)" '.status = "ready" | .ready_at = $ready_at' \
  "$results_dir/inventory.json" >"$inventory_tmp"
mv -- "$inventory_tmp" "$results_dir/inventory.json"

printf 'Provisioned proof %s on instance %s\n' "$proof_id" "$instance_id"
