#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket.this' 'orchestrator-resources-qa'
terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket_versioning.this' 'orchestrator-resources-qa'
terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket_server_side_encryption_configuration.this' 'orchestrator-resources-qa'
terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket_public_access_block.this' 'orchestrator-resources-qa'
terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket_policy.this' 'orchestrator-resources-qa'
terraform import -var-file=environments/terraform.tfvars 'module.orchestrator_resources_qa.aws_s3_bucket_acl.this' 'orchestrator-resources-qa,private'