#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.subnet["subnet_0aec9ccc3d679b626"].aws_subnet.this' 'subnet-0aec9ccc3d679b626'
