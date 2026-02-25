resource "aws_cloudfront_origin_access_identity" "s3_oai" {
  comment = "Origin Access Identity for infra2code S3 bucket"
}

resource "aws_cloudfront_distribution" "main" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = "infra2code"
  default_root_object = var.default_root_object
  http_version        = "http2and3"
  price_class         = var.price_class

  aliases = [var.domain_name]

  origin {
    connection_attempts = 3
    connection_timeout  = 10
    domain_name         = var.s3_origin_domain
    origin_id           = var.s3_origin_domain

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.s3_oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods            = ["GET", "HEAD"]
    cached_methods             = ["GET", "HEAD"]
    cache_policy_id            = var.cache_policy_id
    compress                   = true
    response_headers_policy_id = var.response_headers_policy_id
    target_origin_id           = var.s3_origin_domain
    viewer_protocol_policy     = "redirect-to-https"
  }

  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
  }

  custom_error_response {
    error_caching_min_ttl = 10
    error_code            = 404
    response_code         = 404
    response_page_path    = "/index.html"
  }

  restrictions {
    geo_restriction {
      locations        = var.geo_whitelist_countries
      restriction_type = "whitelist"
    }
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  logging_config {
    bucket          = var.logging_bucket
    include_cookies = true
    prefix          = var.logging_prefix
  }

  tags = var.tags
}