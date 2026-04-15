#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars 'module.neha_private_runner_autoscale_lambda_role.aws_iam_role.this' 'Neha_Private_Runner-autoscale-lambda-role'
tofu1.11.2 import -var-file environments/terraform.tfvars 'module.neha_private_runner_autoscale_lambda_role.aws_iam_role_policy_attachment.this["arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy"]' 'Neha_Private_Runner-autoscale-lambda-role/arn:aws:iam::790543352839:policy/Neha_Private_Runner-autoscale-lambda-policy'