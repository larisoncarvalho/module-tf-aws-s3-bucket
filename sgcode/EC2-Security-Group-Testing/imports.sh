#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.instance["sg_created_test_instance"].aws_instance.this' 'i-0a69c0ca1342b636c'
"$1" import -var-file environments/sg.tfvars 'module.network_interface["eni_0fef14b2c7dd7d059"].aws_network_interface.this' 'eni-0fef14b2c7dd7d059'
