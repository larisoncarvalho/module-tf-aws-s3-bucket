variable "aliases" {
  description = "Domain aliases for the CloudFront distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment for the distribution"
  type        = string
}

variable "origin_domain_name" {
  description = "S3 bucket domain name for origin"
  type        = string
}

variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
}

variable "origin_access_identity" {
  description = "CloudFront origin access identity path"
  type        = string
}

variable "default_root_object" {
  description = "Default root object for the distribution"
  type        = string
  default     = "/index.html"
}

variable "acm_certificate_arn" {
  description = "ARN of ACM certificate for HTTPS"
  type        = string
}

variable "function_arn" {
  description = "ARN of CloudFront function for viewer requests"
  type        = string
}

variable "cache_policy_id" {
  description = "ID of the cache policy to use"
  type        = string
}

variable "price_class" {
  description = "Price class for the distribution"
  type        = string
  default     = "PriceClass_All"
}

variable "custom_error_responses" {
  description = "Custom error response configurations"
  type = list(object({
    error_code             = number
    response_code          = number
    response_page_path     = string
    error_caching_min_ttl  = number
  }))
  default = []
}