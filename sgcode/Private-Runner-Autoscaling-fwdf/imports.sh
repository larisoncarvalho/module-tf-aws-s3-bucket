#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_lambda_function.this[0]' 'Neha_Private_Runner-autoscale-private-runner'
"$1" import -var-file environments/sg.tfvars 'module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_lambda_function.this[0]' 'SG_RUNNER_new-autoscale-private-runner'
"$1" import -var-file environments/sg.tfvars 'module.lambda_functions["neha_private_runner_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]' '/aws/lambda/Neha_Private_Runner-autoscale-private-runner'
"$1" import -var-file environments/sg.tfvars 'module.lambda_functions["sg_runner_new_autoscale_private_runner"].aws_cloudwatch_log_group.lambda[0]' '/aws/lambda/SG_RUNNER_new-autoscale-private-runner'
