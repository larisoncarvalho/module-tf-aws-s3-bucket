#!/bin/sh
set -e

echo "Importing module.stackguardian_certificate.aws_acm_certificate.stackguardian..."
terraform import "module.stackguardian_certificate.aws_acm_certificate.stackguardian" "arn:aws:acm:eu-central-1:474240146802:certificate/stackguardian.io"