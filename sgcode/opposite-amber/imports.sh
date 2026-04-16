#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.ecs_cluster.aws_ecs_cluster.this' 'platform-services'