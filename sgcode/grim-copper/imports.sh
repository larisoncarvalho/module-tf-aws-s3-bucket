#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.iam_policy.aws_iam_policy.this' 'arn:aws:iam::714114208215:policy/All'