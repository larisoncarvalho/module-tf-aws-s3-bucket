#!/bin/sh
set -e

terraform import 'module.cloudfront_distributions["non_prod_euc1"].aws_cloudfront_distribution.this' 'E17OHT8C821DUN'
terraform import 'module.cloudfront_distributions["nonprod_euw2"].aws_cloudfront_distribution.this' 'E19JUATAOUM04F'
terraform import 'module.cloudfront_distributions["docs"].aws_cloudfront_distribution.this' 'E231285MUCAHZ'