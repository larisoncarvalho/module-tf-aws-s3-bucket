#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack.aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'