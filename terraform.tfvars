region = "us-east-1"

cloudfront_distributions = {
  non_prod_euc1 = {
    aliases = [
      "sg-nonprod-euc1.qa.stackguardian.io",
      "dash.qa.stackguardian.io"
    ]
    comment             = "non-prod-euc1"
    default_root_object = "index.html"
    enabled             = true
    http_version        = "HTTP2and3"
    is_ipv6_enabled     = true
    price_class         = "PriceClass_All"
    origins = [
      {
        domain_name            = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
        origin_id              = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
        connection_attempts    = 3
        connection_timeout     = 10
        origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
        origin_shield_enabled  = false
      }
    ]
    default_cache_behavior = {
      allowed_methods            = ["HEAD", "GET"]
      cached_methods             = ["HEAD", "GET"]
      target_origin_id           = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
      viewer_protocol_policy     = "redirect-to-https"
      compress                   = true
      cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      response_headers_policy_id = "1a3788e6-d628-4eff-8bf4-5796dc64f23e"
      smooth_streaming           = false
      trusted_key_groups         = []
      trusted_signers            = []
      function_association       = []
    }
    custom_error_responses = [
      {
        error_code            = 403
        response_code         = "200"
        response_page_path    = "/index.html"
        error_caching_min_ttl = 10
      },
      {
        error_code            = 404
        response_code         = "404"
        response_page_path    = "/index.html"
        error_caching_min_ttl = 10
      }
    ]
    geo_restriction_type           = "none"
    acm_certificate_arn            = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
    logging_enabled                = true
    logging_bucket                 = "sg-logs-qa.s3.amazonaws.com"
    logging_include_cookies        = true
    logging_prefix                 = "cloudfront/dash"
  }

  nonprod_euw2 = {
    aliases = [
      "sg-nonprod-euw2.qa.stackguardian.io"
    ]
    comment             = "nonprod-euw2"
    default_root_object = "index.html"
    enabled             = true
    http_version        = "HTTP2and3"
    is_ipv6_enabled     = true
    price_class         = "PriceClass_All"
    origins = [
      {
        domain_name            = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
        origin_id              = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
        connection_attempts    = 3
        connection_timeout     = 10
        origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
        origin_shield_enabled  = false
      },
      {
        domain_name            = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        origin_id              = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        connection_attempts    = 3
        connection_timeout     = 10
        origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
        origin_shield_enabled  = false
      }
    ]
    default_cache_behavior = {
      allowed_methods            = ["HEAD", "GET"]
      cached_methods             = ["HEAD", "GET"]
      target_origin_id           = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
      viewer_protocol_policy     = "redirect-to-https"
      compress                   = true
      cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"
      smooth_streaming           = false
      trusted_key_groups         = []
      trusted_signers            = []
      function_association       = []
    }
    custom_error_responses = [
      {
        error_code            = 403
        response_code         = "200"
        response_page_path    = "/index.html"
        error_caching_min_ttl = 10
      },
      {
        error_code            = 404
        response_code         = "404"
        response_page_path    = "/index.html"
        error_caching_min_ttl = 10
      }
    ]
    geo_restriction_type           = "none"
    acm_certificate_arn            = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
    logging_enabled                = true
    logging_bucket                 = "sg-logs-qa.s3.amazonaws.com"
    logging_include_cookies        = true
    logging_prefix                 = "cloudfront/dash"
  }

  docs = {
    aliases = [
      "docs.qa.stackguardian.io"
    ]
    comment             = "docs"
    default_root_object = "/index.html"
    enabled             = true
    http_version        = "HTTP2"
    is_ipv6_enabled     = true
    price_class         = "PriceClass_All"
    origins = [
      {
        domain_name            = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        origin_id              = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        connection_attempts    = 3
        connection_timeout     = 10
        origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
        origin_shield_enabled  = false
      }
    ]
    default_cache_behavior = {
      allowed_methods            = ["HEAD", "GET"]
      cached_methods             = ["HEAD", "GET"]
      target_origin_id           = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
      viewer_protocol_policy     = "redirect-to-https"
      compress                   = true
      cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      response_headers_policy_id = null
      smooth_streaming           = false
      trusted_key_groups         = []
      trusted_signers            = []
      function_association = [
        {
          event_type   = "viewer-request"
          function_arn = "arn:aws:cloudfront::790543352839:function/redirect-lambda"
        }
      ]
    }
    custom_error_responses = [
      {
        error_code            = 403
        response_code         = "200"
        response_page_path    = "/index.html"
        error_caching_min_ttl = 1200000
      }
    ]
    geo_restriction_type           = "none"
    acm_certificate_arn            = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
    ssl_support_method             = "sni-only"
    minimum_protocol_version       = "TLSv1.2_2021"
    cloudfront_default_certificate = false
    logging_enabled                = false
    logging_bucket                 = ""
    logging_include_cookies        = false
    logging_prefix                 = ""
  }
}