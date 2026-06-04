#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this' 'stackguardian-nonprod/sg_infra_2_code'
