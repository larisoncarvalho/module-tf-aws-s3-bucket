resource "aws_cloudfront_distribution" "docs" {
  aliases             = var.aliases
  comment             = var.comment
  default_root_object = var.default_root_object
  enabled             = true
  http_version        = "http2"
  is_ipv6_enabled     = true
  price_class         = var.price_class

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = var.origin_domain_name
    origin_id           = var.origin_id

    s3_origin_config {
      origin_access_identity = var.origin_access_identity
    }

    origin_shield {
      enabled = false
    }
  }

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    cache_policy_id        = var.cache_policy_id
    compress               = true
    target_origin_id       = var.origin_id
    viewer_protocol_policy = "redirect-to-https"

    function_association {
      event_type   = "viewer-request"
      function_arn = var.function_arn
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

  logging_config {
    bucket          = ""
    include_cookies = false
    prefix          = ""
  }
}