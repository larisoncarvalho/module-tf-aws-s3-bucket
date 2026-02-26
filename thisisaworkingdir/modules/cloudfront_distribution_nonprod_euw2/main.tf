resource "aws_cloudfront_distribution" "nonprod_euw2" {
  enabled             = var.enabled
  comment             = var.comment
  aliases             = var.aliases
  default_root_object = var.default_root_object
  http_version        = "http2and3"
  is_ipv6_enabled     = true
  price_class         = "PriceClass_All"

  dynamic "origin" {
    for_each = var.origins
    content {
      domain_name         = origin.value.domain_name
      origin_id           = origin.value.origin_id
      connection_attempts = 3
      connection_timeout  = 10

      s3_origin_config {
        origin_access_identity = origin.value.s3_origin_config.origin_access_identity
      }

      origin_shield {
        enabled = false
      }
    }
  }

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    cache_policy_id            = var.cache_policy_id
    compress                   = true
    response_headers_policy_id = var.response_headers_policy_id
    smooth_streaming           = false
    target_origin_id           = var.origins[0].origin_id
    viewer_protocol_policy     = "redirect-to-https"
  }

  dynamic "custom_error_response" {
    for_each = var.custom_error_responses
    content {
      error_code            = custom_error_response.value.error_code
      error_caching_min_ttl = custom_error_response.value.error_caching_min_ttl
      response_code         = custom_error_response.value.response_code
      response_page_path    = custom_error_response.value.response_page_path
    }
  }

  logging_config {
    bucket          = var.logging_bucket
    include_cookies = true
    prefix          = var.logging_prefix
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }
}