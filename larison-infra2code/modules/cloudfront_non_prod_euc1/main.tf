resource "aws_cloudfront_distribution" "non_prod_euc1" {
  aliases             = var.aliases
  comment             = var.comment
  default_root_object = "index.html"
  enabled             = true
  http_version        = "http2and3"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"

  dynamic "origin" {
    for_each = var.origins
    content {
      connection_attempts = 3
      connection_timeout  = 10
      domain_name         = origin.value.domain_name
      origin_id           = origin.value.origin_id

      s3_origin_config {
        origin_access_identity = origin.value.s3_origin_config.origin_access_identity
      }
    }
  }

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cache_policy_id            = var.default_cache_behavior.cache_policy_id
    cached_methods             = ["GET", "HEAD"]
    compress                   = true
    response_headers_policy_id = var.default_cache_behavior.response_headers_policy_id
    smooth_streaming           = false
    target_origin_id           = var.default_cache_behavior.target_origin_id
    trusted_key_groups         = []
    trusted_signers            = []
    viewer_protocol_policy     = var.default_cache_behavior.viewer_protocol_policy
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses
    content {
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
      error_code            = custom_error_response.value.error_code
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
    }
  }

  logging_config {
    bucket          = var.logging_config.bucket
    include_cookies = var.logging_config.include_cookies
    prefix          = var.logging_config.prefix
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
    ssl_support_method             = "sni-only"
  }
}