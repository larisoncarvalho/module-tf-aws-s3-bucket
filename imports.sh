#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.internet_gateway.aws_internet_gateway.this' 'igw-02aec4b4978ee2879'