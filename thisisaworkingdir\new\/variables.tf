variable "nonprod_euc1_enabled" {
  description = "Enable non-prod-euc1 distribution"
  type        = bool
}

variable "nonprod_euc1_comment" {
  description = "Comment for non-prod-euc1 distribution"
  type        = string
}

variable "nonprod_euc1_aliases" {
  description = "Aliases for non-prod-euc1 distribution"
  type        = list(string)
}

variable "nonprod_euc1_default_root_object" {
  description = "Default root object for non-prod-euc1"
  type        = string
}

variable "nonprod_euc1_origins" {
  description = "Origins for non-prod-euc1 distribution"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "nonprod_euc1_cache_policy_id" {
  description = "Cache policy ID for non-prod-euc1"
  type        = string
}

variable "nonprod_euc1_response_headers_policy_id" {
  description = "Response headers policy ID for non-prod-euc1"
  type        = string
}

variable "nonprod_euc1_custom_error_responses" {
  description = "Custom error responses for non-prod-euc1"
  type = list(object({
    error_code            = number
    error_caching_min_ttl = number
    response_code         = number
    response_page_path    = string
  }))
}

variable "nonprod_euc1_logging_prefix" {
  description = "Logging prefix for non-prod-euc1"
  type        = string
}

variable "nonprod_euw2_enabled" {
  description = "Enable nonprod-euw2 distribution"
  type        = bool
}

variable "nonprod_euw2_comment" {
  description = "Comment for nonprod-euw2 distribution"
  type        = string
}

variable "nonprod_euw2_aliases" {
  description = "Aliases for nonprod-euw2 distribution"
  type        = list(string)
}

variable "nonprod_euw2_default_root_object" {
  description = "Default root object for nonprod-euw2"
  type        = string
}

variable "nonprod_euw2_origins" {
  description = "Origins for nonprod-euw2 distribution"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "nonprod_euw2_cache_policy_id" {
  description = "Cache policy ID for nonprod-euw2"
  type        = string
}

variable "nonprod_euw2_response_headers_policy_id" {
  description = "Response headers policy ID for nonprod-euw2"
  type        = string
}

variable "nonprod_euw2_custom_error_responses" {
  description = "Custom error responses for nonprod-euw2"
  type = list(object({
    error_code            = number
    error_caching_min_ttl = number
    response_code         = number
    response_page_path    = string
  }))
}

variable "nonprod_euw2_logging_prefix" {
  description = "Logging prefix for nonprod-euw2"
  type        = string
}

variable "logging_bucket" {
  description = "S3 bucket for CloudFront access logs"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for SSL/TLS"
  type        = string
}