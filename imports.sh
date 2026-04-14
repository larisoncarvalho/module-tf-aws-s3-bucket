#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role.this' 'stulyze-sms'
"$1" import -var-file environments/sg.tfvars 'module.iam_role.aws_iam_role_policy_attachment.this["cognito_1690255817691"]' 'stulyze-sms/arn:aws:iam::714114208215:policy/service-role/Cognito-1690255817691'