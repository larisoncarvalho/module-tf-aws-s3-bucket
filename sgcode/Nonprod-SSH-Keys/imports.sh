#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.key_pair["nonprod_adis"].aws_key_pair.this' 'nonprod-adis'
