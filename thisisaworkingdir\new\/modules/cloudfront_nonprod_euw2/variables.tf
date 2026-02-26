variable "aliases" {
  description = "Domain aliases for the CloudFront distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
}

variable "origins" {
  description = "Origins configuration"
  type = list(object({
    domain_name = string
    origin_id   = string
    s3_origin_config = object({
      origin_access_identity = string
    })
  }))
}

variable "cache_policy_id" {
  description = "Cache policy ID"
  type        = string
}

variable "response_headers_policy_id" {
  description = "Response headers policy ID"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN"
  type        = string
}

variable "logging_bucket" {
  description = "S3 bucket for logging"
  type        = string
}

variable "logging_prefix" {
  description = "Prefix for log files"
  type        = string
}