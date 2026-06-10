#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_role["stulyze_sms"].aws_iam_role.this' 'stulyze-sms'
"$1" import -var-file environments/sg.tfvars 'module.iam_role["stulyze_django_dev_zappa_lambda_execution_role"].aws_iam_role.this' 'stulyze-django-dev-ZappaLambdaExecutionRole'