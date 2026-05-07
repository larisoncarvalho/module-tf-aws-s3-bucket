#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.s3_bucket.aws_s3_bucket.this' 'config-bucket-790543352839'