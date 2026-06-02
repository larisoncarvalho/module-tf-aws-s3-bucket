#!/bin/sh
set -e

TF_BIN_PATH="$1"
[ -z "$TF_BIN_PATH" ] && { echo "Usage: $0 <tf-bin-path>" >&2; exit 1; }

"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_instance.this' 'i-0a0ca27d00e7e74b9'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_key_pair.this' 'taher-private-runner'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_security_group.this' 'sg-092a5ff991a0802bc'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_subnet.this' 'subnet-072669658da496c4a'
"$TF_BIN_PATH" import -var-file environments/sg.tfvars 'module.instance.aws_vpc.this' 'vpc-0119b9388f2104572'