#!/bin/sh
set -e

terraform import -var-file=environments/terraform.tfvars 'module.instance.aws_instance.this' 'i-01494deda99ac7624'
terraform import -var-file=environments/terraform.tfvars 'module.key_pair.aws_key_pair.this' 'key-07b4fecdf3b13a3b9'
terraform import -var-file=environments/terraform.tfvars 'module.instance.aws_network_interface.this' 'eni-0cde3d4209449554a'