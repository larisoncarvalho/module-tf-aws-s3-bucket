non_prod_euc1_aliases = [
  "sg-nonprod-euc1.qa.stackguardian.io",
  "dash.qa.stackguardian.io"
]

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

non_prod_euc1_response_headers_policy_id = "1a3788e6-d628-4eff-8bf4-5796dc64f23e"

nonprod_euw2_aliases = [
  "sg-nonprod-euw2.qa.stackguardian.io"
]

nonprod_euw2_comment = "nonprod-euw2"

nonprod_euw2_origins = [
  {
    domain_name = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
    }
  },
  {
    domain_name = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
    }
  }
]

nonprod_euw2_cache_policy_id = "658327ea-f89d-4fab-a63d-7e88639e58f6"

nonprod_euw2_response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"

acm_certificate_arn = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"

logging_bucket = "sg-logs-qa.s3.amazonaws.com"

logging_prefix = "cloudfront/dash"