#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket.this' 'test-1-1-3'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_versioning.this' 'test-1-1-3'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_server_side_encryption_configuration.this' 'test-1-1-3'
"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket_acl.this' 'test-1-1-3'