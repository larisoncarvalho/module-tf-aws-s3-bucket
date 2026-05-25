#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.project_iam_policy.google_project_iam_policy.this' '597595105496'