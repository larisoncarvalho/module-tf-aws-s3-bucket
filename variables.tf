variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cloudfront_distributions" {
  description = "Map of CloudFront distributions to create"
  type = map(object({
    aliases             = list(string)
    comment             = string
    default_root_object = string
    enabled             = bool
    http_version        = string
    is_ipv6_enabled     = bool
    price_class         = string
    origins = list(object({
      domain_name            = string
      origin_id              = string
      connection_attempts    = number
      connection_timeout     = number
      origin_access_identity = optional(string)
      origin_shield_enabled  = bool
    }))
    default_cache_behavior = object({
      allowed_methods            = list(string)
      cached_methods             = list(string)
      target_origin_id           = string
      viewer_protocol_policy     = string
      compress                   = bool
      cache_policy_id            = string
      response_headers_policy_id = optional(string)
      smooth_streaming           = bool
      trusted_key_groups         = list(string)
      trusted_signers            = list(string)
      function_association = optional(list(object({
        event_type   = string
        function_arn = string
      })), [])
    })
    custom_error_responses = list(object({
      error_code            = number
      response_code         = string
      response_page_path    = string
      error_caching_min_ttl = number
    }))
    geo_restriction_type           = string
    acm_certificate_arn            = string
    ssl_support_method             = string
    minimum_protocol_version       = string
    cloudfront_default_certificate = bool
    logging_enabled                = bool
    logging_bucket                 = string
    logging_include_cookies        = bool
    logging_prefix                 = string
  }))
}