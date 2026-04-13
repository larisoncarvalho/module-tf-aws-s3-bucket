#!/bin/sh
set -e
terraform import module.cloudformation_stack.aws_cloudformation_stack.this stulyze-app