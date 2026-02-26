variable "non_prod_euc1_aliases" {
  description = "Aliases for non-prod-euc1 distribution"
  type        = list(string)
}

variable "non_prod_euc1_comment" {
  description = "Comment for non-prod-euc1 distribution"
  type        = string
}

variable "non_prod_euc1_origins" {
  description = "Origins for non-prod-euc1 distribution"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "non_prod_euc1_cache_behavior" {
  description = "Cache behavior for non-prod-euc1 distribution"
  type = object({
    target_origin_id           = string
    viewer_protocol_policy     = string
    cache_policy_id            = string
    response_headers_policy_id = string
  })
}

variable "non_prod_euc1_error_responses" {
  description = "Custom error responses for non-prod-euc1 distribution"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
}

variable "nonprod_euw2_aliases" {
  description = "Aliases for nonprod-euw2 distribution"
  type        = list(string)
}

variable "nonprod_euw2_comment" {
  description = "Comment for nonprod-euw2 distribution"
  type        = string
}

variable "nonprod_euw2_origins" {
  description = "Origins for nonprod-euw2 distribution with multiple S3 buckets"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "nonprod_euw2_cache_behavior" {
  description = "Cache behavior for nonprod-euw2 distribution"
  type = object({
    target_origin_id           = string
    viewer_protocol_policy     = string
    cache_policy_id            = string
    response_headers_policy_id = string
  })
}

variable "nonprod_euw2_error_responses" {
  description = "Custom error responses for nonprod-euw2 distribution"
  type = list(object({
    error_code            = number
    response_code         = number
    response_page_path    = string
    error_caching_min_ttl = number
  }))
}

variable "logging_config" {
  description = "Logging configuration for CloudFront distributions"
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