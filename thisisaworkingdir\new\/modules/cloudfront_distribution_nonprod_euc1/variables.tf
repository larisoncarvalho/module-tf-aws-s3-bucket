variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
  default     = null
}

variable "aliases" {
  description = "Alternative domain names for the distribution"
  type        = list(string)
  default     = []
}

variable "default_root_object" {
  description = "Object that CloudFront returns when root URL is requested"
  type        = string
  default     = "index.html"
}

variable "origins" {
  description = "Origin configurations"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
  default = []
}

variable "cache_policy_id" {
  description = "Cache policy ID for default cache behavior"
  type        = string
  default     = null
}

variable "response_headers_policy_id" {
  description = "Response headers policy ID"
  type        = string
  default     = null
}

variable "custom_error_responses" {
  description = "Custom error response configurations"
  type = list(object({
    error_code            = number
    error_caching_min_ttl = number
    response_code         = number
    response_page_path    = string
  }))
  default = []
}

variable "logging_bucket" {
  description = "S3 bucket for access logs"
  type        = string
  default     = null
}

variable "logging_prefix" {
  description = "Prefix for log files"
  type        = string
  default     = null
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for SSL/TLS"
  type        = string
  default     = null
}