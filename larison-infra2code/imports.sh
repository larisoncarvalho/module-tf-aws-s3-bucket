#!/bin/sh
set -e

echo "Importing module.non_prod_euc1_distribution.aws_cloudfront_distribution.non_prod_euc1..."
terraform import "module.non_prod_euc1_distribution.aws_cloudfront_distribution.non_prod_euc1" "E17OHT8C821DUN"

echo "Importing module.nonprod_euw2_distribution.aws_cloudfront_distribution.nonprod_euw2..."
terraform import "module.nonprod_euw2_distribution.aws_cloudfront_distribution.nonprod_euw2" "E19JUATAOUM04F"

echo "All imports completed successfully."