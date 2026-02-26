variable "acm_certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
}

variable "logging_bucket" {
  description = "S3 bucket for CloudFront logs"
  type        = string
}

variable "logging_prefix" {
  description = "Prefix for CloudFront log files"
  type        = string
}

variable "non_prod_euc1_aliases" {
  description = "Domain aliases for non-prod-euc1 distribution"
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

variable "non_prod_euc1_cache_policy_id" {
  description = "Cache policy ID for non-prod-euc1"
  type        = string
}

variable "non_prod_euc1_response_headers_policy_id" {
  description = "Response headers policy ID for non-prod-euc1"
  type        = string
}

variable "non_prod_euc1_target_origin_id" {
  description = "Target origin ID for non-prod-euc1 default cache behavior"
  type        = string
}

variable "nonprod_euw2_aliases" {
  description = "Domain aliases for nonprod-euw2 distribution"
  type        = list(string)
}

variable "nonprod_euw2_comment" {
  description = "Comment for nonprod-euw2 distribution"
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

variable "nonprod_euw2_target_origin_id" {
  description = "Target origin ID for nonprod-euw2 default cache behavior"
  type        = string
}