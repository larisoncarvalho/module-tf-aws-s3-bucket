#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.instance.aws_instance.this' 'i-0a0ca27d00e7e74b9'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.instance.aws_key_pair.this' 'taher-private-runner'
"$TF_BIN_PATH" import -var-file=environments/terraform.tfvars 'module.instance.aws_network_interface.this' 'eni-0ad57450ced1dd2d6'