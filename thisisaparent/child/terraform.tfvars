acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/example"
logging_bucket = "example-logs.s3.amazonaws.com"
logging_prefix = "cloudfront/"

non_prod_euc1_aliases = ["example.com"]
non_prod_euc1_comment = "non-prod-euc1"
non_prod_euc1_origins = [
  {
    domain_name = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
    }
  }
]
non_prod_euc1_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
non_prod_euc1_response_headers_policy_id = "67f7725c-6f97-4210-82d7-5512b31e9d03"
non_prod_euc1_target_origin_id = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"

nonprod_euw2_aliases = ["example2.com"]
nonprod_euw2_comment = "nonprod-euw2"
nonprod_euw2_origins = [
  {
    domain_name = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
    }
  },
  {
    domain_name = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
    }
  }
]
nonprod_euw2_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"
nonprod_euw2_response_headers_policy_id = "67f7725c-6f97-4210-82d7-5512b31e9d03"
nonprod_euw2_target_origin_id = "sg-docs-qa.s3.eu-central-1.amazonaws.com"