#!/bin/sh
set -e

terraform import 'module.s3_private_runner_storage_backend.aws_s3_bucket.this' '7ungwu6v-private-runner-storage-backend'
terraform import 'module.s3_private_runner_storage_backend.aws_s3_bucket_server_side_encryption_configuration.this' '7ungwu6v-private-runner-storage-backend'
terraform import 'module.s3_private_runner_storage_backend.aws_s3_bucket_public_access_block.this' '7ungwu6v-private-runner-storage-backend'
terraform import 'module.s3_private_runner_storage_backend.aws_s3_bucket_ownership_controls.this' '7ungwu6v-private-runner-storage-backend'