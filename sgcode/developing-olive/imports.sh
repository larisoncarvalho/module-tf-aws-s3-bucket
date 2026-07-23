#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.vpc.aws_vpc.this' 'vpc-024344e8549773d40'