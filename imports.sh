#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars module.backend_storage.aws_s3_bucket.this 7ungwu6v-private-runner-storage-backend
terraform import -var-file=environments/terraform.tfvars module.backend_storage.aws_s3_bucket_ownership_controls.this 7ungwu6v-private-runner-storage-backend
terraform import -var-file=environments/terraform.tfvars module.backend_storage.aws_s3_bucket_public_access_block.this 7ungwu6v-private-runner-storage-backend
terraform import -var-file=environments/terraform.tfvars module.backend_storage.aws_s3_bucket_server_side_encryption_configuration.this 7ungwu6v-private-runner-storage-backend