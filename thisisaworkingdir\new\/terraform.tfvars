non_prod_euc1_aliases = [
  "dash.qa.stackguardian.io",
  "sg-nonprod-euc1.qa.stackguardian.io"
]
non_prod_euc1_comment = "Non-prod EUC1 CloudFront distribution"
non_prod_euc1_origins = [
  {
    domain_name = "sg-react-dashboard-nonprod-euc1.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-react-dashboard-nonprod-euc1.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/E3EXAMPLE"
    }
  }
]
non_prod_euc1_cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
non_prod_euc1_response_headers_policy_id = "1a3788e6-d628-4eff-8bf4-5796dc64f23e"
non_prod_euc1_target_origin_id           = "sg-react-dashboard-nonprod-euc1.s3.eu-central-1.amazonaws.com"
non_prod_euc1_acm_certificate_arn        = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
non_prod_euc1_logging_bucket             = "sg-logs-qa.s3.amazonaws.com"
non_prod_euc1_logging_prefix             = "cloudfront/dash"

nonprod_euw2_aliases = [
  "sg-nonprod-euw2.qa.stackguardian.io"
]
nonprod_euw2_comment = "Nonprod EUW2 CloudFront distribution"
nonprod_euw2_origins = [
  {
    domain_name = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    origin_id   = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/E3EXAMPLE2"
    }
  }
]
nonprod_euw2_cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
nonprod_euw2_response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"
nonprod_euw2_target_origin_id           = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
nonprod_euw2_acm_certificate_arn        = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
nonprod_euw2_logging_bucket             = "sg-logs-qa.s3.amazonaws.com"
nonprod_euw2_logging_prefix             = "cloudfront/dash"