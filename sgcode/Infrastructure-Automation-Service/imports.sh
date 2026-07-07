#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.service_account["infra2code_gcp"].google_service_account.this' 'projects/stackguardian-nonprod/serviceAccounts/infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com'
