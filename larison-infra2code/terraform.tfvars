non_prod_euc1_aliases = ["example-nonprod-euc1.example.com"]

non_prod_euc1_comment = "Non-prod EUC1 CloudFront Distribution"

non_prod_euc1_origins = [
  {
    domain_name = "example-bucket-euc1.s3.amazonaws.com"
    origin_id   = "S3-example-bucket-euc1"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/EXAMPLE1234567"
    }
  }
]

non_prod_euc1_cache_behavior = {
  target_origin_id           = "S3-example-bucket-euc1"
  viewer_protocol_policy     = "redirect-to-https"
  cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  response_headers_policy_id = "67f7725c-6f97-4210-82d7-5512b31e9d03"
}

non_prod_euc1_error_responses = [
  {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 300
  },
  {
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 300
  }
]

nonprod_euw2_aliases = ["example-nonprod-euw2.example.com"]

nonprod_euw2_comment = "Non-prod EUW2 CloudFront Distribution"

nonprod_euw2_origins = [
  {
    domain_name = "example-bucket-euw2-1.s3.amazonaws.com"
    origin_id   = "S3-example-bucket-euw2-1"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/EXAMPLE7654321"
    }
  },
  {
    domain_name = "example-bucket-euw2-2.s3.amazonaws.com"
    origin_id   = "S3-example-bucket-euw2-2"
    s3_origin_config = {
      origin_access_identity = "origin-access-identity/cloudfront/EXAMPLE7654321"
    }
  }
]

nonprod_euw2_cache_behavior = {
  target_origin_id           = "S3-example-bucket-euw2-1"
  viewer_protocol_policy     = "redirect-to-https"
  cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
  response_headers_policy_id = "67f7725c-6f97-4210-82d7-5512b31e9d03"
}

nonprod_euw2_error_responses = [
  {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 300
  },
  {
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 300
  }
]

logging_config = {
  bucket          = "example-cloudfront-logs.s3.amazonaws.com"
  include_cookies = false
  prefix          = "cloudfront-logs/"
}

acm_certificate_arn = "arn:aws:acm:us-east-1:123456789012:certificate/12345678-1234-1234-1234-123456789012"