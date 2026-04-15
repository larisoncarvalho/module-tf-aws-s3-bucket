#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket.this' 'orchestrator-resources-qa'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_acl.this' 'orchestrator-resources-qa'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_versioning.this' 'orchestrator-resources-qa'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_server_side_encryption_configuration.this' 'orchestrator-resources-qa'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_public_access_block.this' 'orchestrator-resources-qa'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_policy.this' 'orchestrator-resources-qa'