#!/bin/sh
set -e

echo "Importing module.nonprod_euc1_distribution.aws_cloudfront_distribution.nonprod_euc1..."
terraform import "module.nonprod_euc1_distribution.aws_cloudfront_distribution.nonprod_euc1" "E17OHT8C821DUN"

echo "Importing module.nonprod_euw2_distribution.aws_cloudfront_distribution.nonprod_euw2..."
terraform import "module.nonprod_euw2_distribution.aws_cloudfront_distribution.nonprod_euw2" "E19JUATAOUM04F"