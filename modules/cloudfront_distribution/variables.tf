variable "aliases" {
  description = "Alternate domain names (CNAMEs) for the distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment to identify the distribution"
  type        = string
}

variable "default_cache_behavior" {
  description = "Default cache behavior configuration"
  type = object({
    allowed_methods            = list(string)
    cached_methods             = list(string)
    cache_policy_id            = string
    compress                   = bool
    target_origin_id           = string
    viewer_protocol_policy     = string
    response_headers_policy_id = string
    smooth_streaming           = bool
    trusted_key_groups         = list(string)
    trusted_signers            = list(string)
  })
}

variable "default_root_object" {
  description = "Object that CloudFront returns when a viewer requests the root URL"
  type        = string
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
}

variable "http_version" {
  description = "Maximum HTTP version to support on the distribution"
  type        = string
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
}

variable "logging_config" {
  description = "Logging configuration for the distribution"
  type = object({
    bucket          = string
    include_cookies = bool
    prefix          = string
  })
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
}

variable "restrictions" {
  description = "Geographic restriction configuration"
  type = object({
    geo_restriction = object({
      restriction_type = string
    })
  })
}

variable "viewer_certificate" {
  description = "SSL/TLS certificate configuration"
  type = object({
    acm_certificate_arn            = string
    ssl_support_method             = string
    minimum_protocol_version       = string
    cloudfront_default_certificate = bool
  })
}

variable "origins" {
  description = "Origins for the distribution"
  type = list(object({
    domain_name         = string
    origin_id           = string
    connection_attempts = number
    connection_timeout  = number
    s3_origin_config = object({
      origin_access_identity = string
    })
    origin_shield = object({
      enabled = bool
    })
  }))
}

variable "custom_error_responses" {
  description = "Custom error response configurations"
  type = list(object({
    error_code            = number
    response_code         = string
    response_page_path    = string
    error_caching_min_ttl = number
  }))
}