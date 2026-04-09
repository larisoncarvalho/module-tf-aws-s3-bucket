#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_instance.this' 'i-01494deda99ac7624'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_key_pair.this' 'taher-private-runner'