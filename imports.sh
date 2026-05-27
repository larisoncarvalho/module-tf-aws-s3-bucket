#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.project_iam_policy.google_project_iam_policy.this' '597595105496'
"$1" import -var-file environments/sg.tfvars 'module.project_iam_audit_config.google_project_iam_audit_config.this' '597595105496/allServices'
"$1" import -var-file environments/sg.tfvars 'module.project_organization_policy.google_project_organization_policy.this' '597595105496/iam.managed.disableServiceAccountApiKeyCreation'
"$1" import -var-file environments/sg.tfvars 'module.service_account_key["service_account_key_1"].google_service_account_key.this["service_account_key_1"]' 'projects/597595105496/serviceAccounts/sg-service-account@597595105496.iam.gserviceaccount.com/keys/0752cc7335a1394b6e54c33c67a41ac2edf06924'
"$1" import -var-file environments/sg.tfvars 'module.service_account_key["service_account_key_2"].google_service_account_key.this["service_account_key_2"]' 'projects/stackguardian-nonprod/serviceAccounts/sg-prod-gcp@stackguardian-nonprod.iam.gserviceaccount.com/keys/115a703bdf0f0b9fa2a0eb3ce930abf5a11328a1'