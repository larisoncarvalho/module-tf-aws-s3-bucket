#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.autoscaling_group.aws_autoscaling_group.this' 'taher-private-runner'