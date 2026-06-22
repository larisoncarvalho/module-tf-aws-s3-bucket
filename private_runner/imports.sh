#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.key_pair["taher_private_runner"].aws_key_pair.this' 'taher-private-runner'
"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_072212cd519ee269f"].aws_ebs_volume.this' 'vol-072212cd519ee269f'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0ad57450ced1dd2d6"].aws_network_interface.this' 'eni-0ad57450ced1dd2d6'
"$1" import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_ubuntu"].aws_instance.this' 'i-0a0ca27d00e7e74b9'
