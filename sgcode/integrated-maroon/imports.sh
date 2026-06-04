#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.storage_bucket.google_storage_bucket.this' 'sg_infra2code_buck'