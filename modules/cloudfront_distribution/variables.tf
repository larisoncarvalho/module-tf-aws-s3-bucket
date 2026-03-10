variable "aliases" {
  description = "Alternate domain names (CNAMEs) for the distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment to describe the distribution"
  type        = string
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
  description = "Maximum HTTP version to support (HTTP2, HTTP2and3, etc.)"
  type        = string
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
}

variable "origins" {
  description = "CloudFront origins configuration"
  type = list(object({
    domain_name              = string
    origin_id                = string
    connection_attempts      = number
    connection_timeout       = number
    origin_access_identity   = optional(string)
    origin_shield_enabled    = bool
  }))
}

variable "default_cache_behavior" {
  description = "Default cache behavior configuration"
  type = object({
    allowed_methods              = list(string)
    cached_methods               = list(string)
    target_origin_id             = string
    viewer_protocol_policy       = string
    compress                     = bool
    cache_policy_id              = string
    response_headers_policy_id   = optional(string)
    smooth_streaming             = bool
    trusted_key_groups           = list(string)
    trusted_signers              = list(string)
    function_association = optional(list(object({
      event_type   = string
      function_arn = string
    })), [])
  })
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

variable "geo_restriction_type" {
  description = "Geographic restriction type (none, whitelist, blacklist)"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
}

variable "ssl_support_method" {
  description = "SSL support method (sni-only or vip)"
  type        = string
}

variable "minimum_protocol_version" {
  description = "Minimum TLS protocol version"
  type        = string
}

variable "cloudfront_default_certificate" {
  description = "Whether to use CloudFront default certificate"
  type        = bool
}

variable "logging_enabled" {
  description = "Whether access logging is enabled"
  type        = bool
}

variable "logging_bucket" {
  description = "S3 bucket for access logs"
  type        = string
}

variable "logging_include_cookies" {
  description = "Whether to include cookies in access logs"
  type        = bool
}

variable "logging_prefix" {
  description = "Prefix for access log files"
  type        = string
}