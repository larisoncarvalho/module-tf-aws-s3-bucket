#!/bin/sh
set -e

terraform import -var-file environments/terraform.tfvars 'module.lambda_autoscale_role.aws_iam_role.this' 'Neha_Private_Runner-autoscale-lambda-role'
terraform import -var-file environments/terraform.tfvars 'module.lambda_autoscale_role.aws_iam_role_policy_attachment.this["arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy"]' 'Neha_Private_Runner-autoscale-lambda-role/arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy'
terraform import -var-file environments/terraform.tfvars 'module.ec2_runner_role.aws_iam_role.this' 'Neha_Private_Runner-ec2-private-runner-role'
terraform import -var-file environments/terraform.tfvars 'module.ec2_runner_role.aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]' 'Neha_Private_Runner-ec2-private-runner-role/arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore'
terraform import -var-file environments/terraform.tfvars 'module.ec2_runner_role.aws_iam_role_policy_attachment.this["arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy"]' 'Neha_Private_Runner-ec2-private-runner-role/arn:aws:iam::790543352839:policy/Neha_Private_Runner-ec2-runner-assume-s3-role-policy'