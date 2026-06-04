#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.instance.aws_instance.this' 'i-0a0ca27d00e7e74b9'