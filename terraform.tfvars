domain_name                = "infra2code.qa.stackguardian.io"
s3_origin_domain           = "sg-infra2code-prototype-qa.s3.eu-central-1.amazonaws.com"
acm_certificate_arn        = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
logging_bucket             = "sg-logs-qa.s3.amazonaws.com"
logging_prefix             = "cloudfront/dash"
geo_whitelist_countries    = ["DE", "MT", "PT", "KY", "GB", "NL", "BA", "BE", "AT", "IN"]
cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"
default_root_object        = "index.html"
price_class                = "PriceClass_All"

common_tags = {
  Name        = "infra2code"
  Environment = "qa"
  ManagedBy   = "Terraform"
  Application = "infra2code"
}