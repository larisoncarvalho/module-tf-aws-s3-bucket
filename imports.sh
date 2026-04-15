#!/bin/sh
set -e

terraform import 'module.s3_private_runner_storage_backend.aws_s3_bucket.this' '7ungwu6v-private-runner-storage-backend'