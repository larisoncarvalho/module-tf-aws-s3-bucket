#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.key_pair.aws_key_pair.this' 'key-07b4fecdf3b13a3b9'
"$1" import -var-file environments/sg.tfvars 'module.instance.aws_network_interface.this' 'eni-0ad57450ced1dd2d6'
"$1" import -var-file environments/sg.tfvars 'module.instance.aws_instance.this' 'i-0a0ca27d00e7e74b9'