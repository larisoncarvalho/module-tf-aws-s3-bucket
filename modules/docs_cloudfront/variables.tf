variable "aliases" {
  description = "Alternative domain names for the distribution"
  type        = list(string)
  default     = null
}

variable "comment" {
  description = "Comment to describe the distribution"
  type        = string
  default     = null
}

variable "default_root_object" {
  description = "Object that CloudFront returns when the root URL is requested"
  type        = string
  default     = "/index.html"
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution"
  type        = bool
  default     = true
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
  default     = "PriceClass_All"
}

variable "http_version" {
  description = "Maximum HTTP version to support"
  type        = string
  default     = "http2"
}

variable "s3_origin_domain" {
  description = "S3 bucket domain name for the origin"
  type        = string
  default     = null
}

variable "s3_origin_id" {
  description = "Unique identifier for the S3 origin"
  type        = string
  default     = null
}

variable "origin_access_identity" {
  description = "CloudFront origin access identity for S3"
  type        = string
  default     = null
}

variable "cache_policy_id" {
  description = "ID of the cache policy"
  type        = string
  default     = null
}

variable "viewer_request_function_arn" {
  description = "ARN of the CloudFront function for viewer requests"
  type        = string
  default     = null
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
  default     = null
}

variable "minimum_protocol_version" {
  description = "Minimum SSL/TLS protocol version"
  type        = string
  default     = "TLSv1.2_2021"
}

variable "custom_error_responses" {
  description = "Custom error response configurations"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
  default = []
}

variable "tags" {
  description = "Tags to apply to the distribution"
  type        = map(string)
  default     = {}
}