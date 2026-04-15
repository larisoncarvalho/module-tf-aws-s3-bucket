distribution_aliases   = ["docs.qa.stackguardian.io"]
distribution_comment   = "docs"
origin_domain_name     = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
origin_id              = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
default_root_object    = "/index.html"
acm_certificate_arn    = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
cloudfront_function_arn = "arn:aws:cloudfront::790543352839:function/redirect-lambda"
cache_policy_id        = "658327ea-f89d-4fab-a63d-7e88639e58f6"
price_class            = "PriceClass_All"
custom_error_responses = [
  {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 1200000
  }
]