#!/bin/sh
set -e

# key-07b4fecdf3b13a3b9 (taher-private-runner) is a phantom — excluded
"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_0eee7b20020c3cdac"].aws_ebs_volume.this' 'vol-0eee7b20020c3cdac'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0cde3d4209449554a"].aws_network_interface.this' 'eni-0cde3d4209449554a'
"$1" import -var-file environments/sg.tfvars 'module.instance["taher_private_runner_amz"].aws_instance.this' 'i-01494deda99ac7624'
