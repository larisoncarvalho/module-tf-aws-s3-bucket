variable "region" {
  description = "AWS region"
  type        = string
  default     = "global"
}

variable "cloudfront_distributions" {
  description = "CloudFront distributions configuration"
  type = map(object({
    aliases                = list(string)
    comment                = string
    default_cache_behavior = any
    default_root_object    = string
    enabled                = bool
    http_version           = string
    is_ipv6_enabled        = bool
    logging_config         = any
    price_class            = string
    restrictions           = any
    viewer_certificate     = any
    origins                = any
    custom_error_responses = any
  }))
}