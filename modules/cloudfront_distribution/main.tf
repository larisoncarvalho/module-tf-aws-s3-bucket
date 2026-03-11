resource "aws_cloudfront_distribution" "this" {
  aliases             = var.aliases
  comment             = var.comment
  default_root_object = var.default_root_object
  enabled             = var.enabled
  http_version        = var.http_version
  is_ipv6_enabled     = var.is_ipv6_enabled
  price_class         = var.price_class

  default_cache_behavior {
    allowed_methods            = var.default_cache_behavior.allowed_methods
    cached_methods             = var.default_cache_behavior.cached_methods
    cache_policy_id            = var.default_cache_behavior.cache_policy_id
    compress                   = var.default_cache_behavior.compress
    response_headers_policy_id = var.default_cache_behavior.response_headers_policy_id
    smooth_streaming           = var.default_cache_behavior.smooth_streaming
    target_origin_id           = var.default_cache_behavior.target_origin_id
    trusted_key_groups         = var.default_cache_behavior.trusted_key_groups
    trusted_signers            = var.default_cache_behavior.trusted_signers
    viewer_protocol_policy     = var.default_cache_behavior.viewer_protocol_policy
  }

  dynamic "origin" {
    for_each = var.origins
    content {
      connection_attempts = origin.value.connection_attempts
      connection_timeout  = origin.value.connection_timeout
      domain_name         = origin.value.domain_name
      origin_id           = origin.value.origin_id

      s3_origin_config {
        origin_access_identity = origin.value.s3_origin_config.origin_access_identity
      }

      origin_shield {
        enabled = origin.value.origin_shield.enabled
      }
    }
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
      restriction_type = var.restrictions.geo_restriction.restriction_type
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.viewer_certificate.acm_certificate_arn
    cloudfront_default_certificate = var.viewer_certificate.cloudfront_default_certificate
    minimum_protocol_version       = var.viewer_certificate.minimum_protocol_version
    ssl_support_method             = var.viewer_certificate.ssl_support_method
  }
}