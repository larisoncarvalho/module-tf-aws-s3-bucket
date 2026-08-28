#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_042be8ba683617c82"].aws_network_interface.this' 'eni-042be8ba683617c82'
