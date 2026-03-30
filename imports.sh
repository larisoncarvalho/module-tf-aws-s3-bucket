#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.s3_bucket.aws_s3_bucket.this stackguardian-devoted-rat