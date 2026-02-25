#!/bin/sh
set -e

echo "Importing module.infra2code_cloudfront.aws_cloudfront_origin_access_identity.s3_oai..."
terraform import "module.infra2code_cloudfront.aws_cloudfront_origin_access_identity.s3_oai" "E1N7LLXZED9G6H"

echo "Importing module.infra2code_cloudfront.aws_cloudfront_distribution.main..."
terraform import "module.infra2code_cloudfront.aws_cloudfront_distribution.main" "E6GKWC5HFJFS8"