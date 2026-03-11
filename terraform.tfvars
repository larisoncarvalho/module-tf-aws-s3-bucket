region = "global"

cloudfront_distributions = {
  non_prod_euc1 = {
    aliases = [
      "sg-nonprod-euc1.qa.stackguardian.io",
      "dash.qa.stackguardian.io"
    ]
    comment = "non-prod-euc1"
    default_cache_behavior = {
      allowed_methods = [
        "HEAD",
        "GET"
      ]
      cached_methods = [
        "HEAD",
        "GET"
      ]
      cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      compress                   = true
      target_origin_id           = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
      viewer_protocol_policy     = "redirect-to-https"
      response_headers_policy_id = "1a3788e6-d628-4eff-8bf4-5796dc64f23e"
      smooth_streaming           = false
      trusted_key_groups = [
        "false"
      ]
      trusted_signers = [
        "false"
      ]
    }
    default_root_object = "index.html"
    enabled             = true
    http_version        = "HTTP2and3"
    is_ipv6_enabled     = true
    logging_config = {
      bucket          = "sg-logs-qa.s3.amazonaws.com"
      include_cookies = true
      prefix          = "cloudfront/dash"
    }
    price_class = "PriceClass_All"
    restrictions = {
      geo_restriction = {
        restriction_type = "none"
      }
    }
    viewer_certificate = {
      acm_certificate_arn            = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
      ssl_support_method             = "sni-only"
      minimum_protocol_version       = "TLSv1.2_2021"
      cloudfront_default_certificate = false
    }
    origins = [
      {
        domain_name         = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
        origin_id           = "sg-react-dashboard-qa.s3.eu-central-1.amazonaws.com"
        connection_attempts = 3
        connection_timeout  = 10
        s3_origin_config = {
          origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
        }
        origin_shield = {
          enabled = false
        }
      }
    ]
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
  }

  nonprod_euw2 = {
    aliases = [
      "sg-nonprod-euw2.qa.stackguardian.io"
    ]
    comment = "nonprod-euw2"
    default_cache_behavior = {
      allowed_methods = [
        "HEAD",
        "GET"
      ]
      cached_methods = [
        "HEAD",
        "GET"
      ]
      cache_policy_id            = "658327ea-f89d-4fab-a63d-7e88639e58f6"
      compress                   = true
      target_origin_id           = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
      viewer_protocol_policy     = "redirect-to-https"
      response_headers_policy_id = "eaab4381-ed33-4a86-88ca-d9558dc6cd63"
      smooth_streaming           = false
      trusted_key_groups = [
        "false"
      ]
      trusted_signers = [
        "false"
      ]
    }
    default_root_object = "index.html"
    enabled             = true
    http_version        = "HTTP2and3"
    is_ipv6_enabled     = true
    logging_config = {
      bucket          = "sg-logs-qa.s3.amazonaws.com"
      include_cookies = true
      prefix          = "cloudfront/dash"
    }
    price_class = "PriceClass_All"
    restrictions = {
      geo_restriction = {
        restriction_type = "none"
      }
    }
    viewer_certificate = {
      acm_certificate_arn            = "arn:aws:acm:us-east-1:790543352839:certificate/1ebf4f02-1f17-4580-b3c3-8a899fc8c703"
      ssl_support_method             = "sni-only"
      minimum_protocol_version       = "TLSv1.2_2021"
      cloudfront_default_certificate = false
    }
    origins = [
      {
        domain_name         = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
        origin_id           = "sg-react-dashboard-nonprod-euw2.s3.eu-central-1.amazonaws.com"
        connection_attempts = 3
        connection_timeout  = 10
        s3_origin_config = {
          origin_access_identity = "origin-access-identity/cloudfront/E3CQIO7RKFIEY6"
        }
        origin_shield = {
          enabled = false
        }
      },
      {
        domain_name         = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        origin_id           = "sg-docs-qa.s3.eu-central-1.amazonaws.com"
        connection_attempts = 3
        connection_timeout  = 10
        s3_origin_config = {
          origin_access_identity = "origin-access-identity/cloudfront/EPRD63SV6WM7V"
        }
        origin_shield = {
          enabled = false
        }
      }
    ]
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
  }
}