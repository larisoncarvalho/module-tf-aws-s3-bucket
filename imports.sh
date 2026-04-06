#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.instance.aws_instance.this' 'i-0a0ca27d00e7e74b9'
terraform import -var-file=environments/terraform.tfvars 'module.key_pair.aws_key_pair.this' 'key-07b4fecdf3b13a3b9'