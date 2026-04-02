#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.cloudformation_sg_1.aws_cloudformation_stack.this arn:aws:cloudformation:eu-central-1:790543352839:stack/Cloudformation-sg-1/5263e390-b477-11ee-aba1-064fc08bbe33