variable "aliases" {
  description = "Alternate domain names for the distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment to describe the distribution"
  type        = string
}

variable "origins" {
  description = "CloudFront origin configuration"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "default_cache_behavior" {
  description = "Default cache behavior configuration"
  type = object({
    target_origin_id           = string
    viewer_protocol_policy     = string
    cache_policy_id            = string
    response_headers_policy_id = string
  })
}

variable "custom_error_responses" {
  description = "Custom error response configuration"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = []
}

variable "logging_config" {
  description = "Logging configuration"
  type = object({
    bucket          = string
    include_cookies = bool
    prefix          = string
  })
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for SSL/TLS"
  type        = string
}