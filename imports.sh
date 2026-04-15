#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.iam_policies.aws_iam_policy.this["neha_private_runner_runner_s3_policy"]' ANPA3QEAOIQDUAV5THQMS
terraform import -var-file=environments/terraform.tfvars 'module.iam_policies.aws_iam_policy.this["neha_private_runner_ec2_runner_assume_s3_role_policy"]' ANPA3QEAOIQDX2GZHZAUH