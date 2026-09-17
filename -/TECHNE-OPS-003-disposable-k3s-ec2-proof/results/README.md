# Proof Results

The retained evidence covers three bounded attempts in AWS account `655383751458`. Every attempt used the same disposable CloudFormation boundary and has a matching teardown record with zero direct active-resource counts.

## Attempts

- **Attempt 1 — shell portability:** Systems Manager invoked `/bin/sh`, which rejected `set -o pipefail`; the workload did not run. The scripts now use portable remote shell options.
- **Attempt 2 — namespace dry-run ordering:** the dry-run namespace was intentionally not persisted, so later namespaced resources were rejected. Validation now dry-runs and creates the namespace before validating namespaced resources.
- **Attempt 3 — completed:** K3s became Ready, every manifest passed a live server-side dry run, the Job succeeded, instance-metadata access was blocked, evidence was collected locally, and the stack was deleted.

The SSO session expired while the third command was being observed and required an interactive refresh. Polling now fails immediately on authentication errors instead of masking them as a pending command. The instance's two-hour termination timer remains the fallback if operator authentication cannot be restored.

## Evidence routes

- `evidence.json` — successful execution, target, manifest hashes and teardown summary
- `cost.json` — elapsed instance time and compute-cost estimate
- `execution-invocation.json` — server-side dry runs, Job completion and workload outcome
- `collection-invocation.json` — observed K3s, Job, pod, image and outcome values
- `teardown.json` — zero direct active-resource counts after stack deletion
- `attempt-1-sh-portability/` and `attempt-2-namespace-dry-run/` — failed-attempt and teardown evidence

AWS's Resource Groups Tagging API continued to report the identifiers of terminated instances after deletion. Direct EC2, VPC, EBS, security-group and IAM checks returned zero; the CloudFormation stack was absent. The tagging list is retained to make that eventual-consistency behaviour visible rather than filtering it from evidence.
