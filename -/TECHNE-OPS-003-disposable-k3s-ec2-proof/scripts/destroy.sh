#!/usr/bin/env bash
set -euo pipefail

script_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)
proof_root=$(cd -- "$script_dir/.." && pwd)
results_dir="$proof_root/results"

profile=knowledge-islands-techne
region=eu-west-1
expected_account=655383751458
stack_name=ki-techne-ops-003-k3s-proof
work_item=TECHNE-OPS-003

export AWS_PAGER=
mkdir -p -- "$results_dir"

caller_account=$(aws sts get-caller-identity --profile "$profile" --query Account --output text)
if [[ "$caller_account" != "$expected_account" ]]; then
  printf 'Refusing cleanup: expected account %s, received %s\n' "$expected_account" "$caller_account" >&2
  exit 1
fi

role_name=
profile_name=
if [[ -f "$results_dir/inventory.json" ]]; then
  role_name=$(jq -r '.outputs.InstanceRoleName // empty' "$results_dir/inventory.json")
  profile_name=$(jq -r '.outputs.InstanceProfileName // empty' "$results_dir/inventory.json")
fi

if aws cloudformation describe-stacks --profile "$profile" --region "$region" --stack-name "$stack_name" >/dev/null 2>&1; then
  aws cloudformation delete-stack \
    --profile "$profile" \
    --region "$region" \
    --stack-name "$stack_name"
  aws cloudformation wait stack-delete-complete \
    --profile "$profile" \
    --region "$region" \
    --stack-name "$stack_name"
fi

vpc_count=$(aws ec2 describe-vpcs --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Vpcs)' --output text)
subnet_count=$(aws ec2 describe-subnets --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Subnets)' --output text)
gateway_count=$(aws ec2 describe-internet-gateways --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(InternetGateways)' --output text)
security_group_count=$(aws ec2 describe-security-groups --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(SecurityGroups)' --output text)
instance_count=$(aws ec2 describe-instances \
  --profile "$profile" \
  --region "$region" \
  --filters "Name=tag:ki-work-item,Values=$work_item" Name=instance-state-name,Values=pending,running,stopping,stopped,shutting-down \
  --query 'length(Reservations[].Instances[])' \
  --output text)
volume_count=$(aws ec2 describe-volumes --profile "$profile" --region "$region" --filters "Name=tag:ki-work-item,Values=$work_item" --query 'length(Volumes)' --output text)

role_present=false
if [[ -n "$role_name" ]] && aws iam get-role --profile "$profile" --role-name "$role_name" >/dev/null 2>&1; then
  role_present=true
fi
instance_profile_present=false
if [[ -n "$profile_name" ]] && aws iam get-instance-profile --profile "$profile" --instance-profile-name "$profile_name" >/dev/null 2>&1; then
  instance_profile_present=true
fi

remaining_tagged=$(aws resourcegroupstaggingapi get-resources \
  --profile "$profile" \
  --region "$region" \
  --tag-filters "Key=ki-work-item,Values=$work_item" \
  --query 'ResourceTagMappingList[].ResourceARN' \
  --output json)

jq -n \
  --arg completed_at "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  --argjson gateway_count "$gateway_count" \
  --argjson instance_count "$instance_count" \
  --argjson instance_profile_present "$instance_profile_present" \
  --argjson remaining_tagged "$remaining_tagged" \
  --argjson role_present "$role_present" \
  --argjson security_group_count "$security_group_count" \
  --argjson subnet_count "$subnet_count" \
  --argjson volume_count "$volume_count" \
  --argjson vpc_count "$vpc_count" \
  '{
    completed_at: $completed_at,
    remaining: {
      instance_profiles: (if $instance_profile_present then 1 else 0 end),
      instances: $instance_count,
      internet_gateways: $gateway_count,
      resource_arns_reported_by_tagging_api: $remaining_tagged,
      roles: (if $role_present then 1 else 0 end),
      security_groups: $security_group_count,
      subnets: $subnet_count,
      volumes: $volume_count,
      vpcs: $vpc_count
    },
    stack: "ki-techne-ops-003-k3s-proof",
    status: "deleted"
  }' >"$results_dir/teardown.json"

jq -e '
  .remaining.instances == 0 and
  .remaining.instance_profiles == 0 and
  .remaining.internet_gateways == 0 and
  .remaining.roles == 0 and
  .remaining.security_groups == 0 and
  .remaining.subnets == 0 and
  .remaining.volumes == 0 and
  .remaining.vpcs == 0
' "$results_dir/teardown.json" >/dev/null

printf 'Teardown verified for stack %s\n' "$stack_name"
