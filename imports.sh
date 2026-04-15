#!/bin/sh
set -e

TF_BIN_PATH="$1"

[ -z "$TF_BIN_PATH" ] && {
  echo "Usage: $0 <tf-bin-path>" >&2
  exit 1
}

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.autoscaling_group.aws_autoscaling_group.this' 'ecs-instances-admin-workflow-qa'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role.this' 'AWSServiceRoleForAutoScaling'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["autoscaling_service_role_policy"]' 'AWSServiceRoleForAutoScaling/arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy'