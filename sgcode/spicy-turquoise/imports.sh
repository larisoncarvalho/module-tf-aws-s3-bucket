#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.instance.aws_instance.this' 'i-00af4198af591318c'