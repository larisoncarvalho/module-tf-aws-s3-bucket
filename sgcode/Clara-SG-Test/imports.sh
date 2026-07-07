#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.service_account["clara_sg_test"].google_service_account.this' 'projects/stackguardian-nonprod/serviceAccounts/clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com'
