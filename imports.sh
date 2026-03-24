#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars module.neha_private_runner_role.aws_iam_role.this "Neha_Private_Runner-ec2-private-runner-role"
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.neha_private_runner_role.aws_iam_role_policy_attachment.this["ssm_managed_instance"]' "Neha_Private_Runner-ec2-private-runner-role/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.neha_private_runner_role.aws_iam_role_policy_attachment.this["s3_assume_role"]' "Neha_Private_Runner-ec2-private-runner-role/arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy"