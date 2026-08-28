#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.ebs_volume["vol_0c902488affe65a8a"].aws_ebs_volume.this' 'vol-0c902488affe65a8a'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0255b9b3f7b719ee0"].aws_network_interface.this' 'eni-0255b9b3f7b719ee0'
"$1" import -var-file environments/sg.tfvars 'module.instance["taher_http_squid_proxy"].aws_instance.this' 'i-0c75a95227d45cb24'
