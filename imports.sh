#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.private_runner_storage.aws_s3_bucket.this 7ungwu6v-private-runner-storage-backend