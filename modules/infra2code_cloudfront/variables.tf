variable "domain_name" {
  description = "CloudFront distribution domain alias"
  type        = string
}

variable "s3_origin_domain" {
  description = "S3 bucket domain name for origin"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
}

variable "logging_bucket" {
  description = "S3 bucket for CloudFront logs"
  type        = string
}

variable "logging_prefix" {
  description = "Prefix for CloudFront logs"
  type        = string
  default     = "cloudfront/dash"
}

variable "geo_whitelist_countries" {
  description = "List of country codes for geo-restriction whitelist"
  type        = list(string)
  default     = []
}

variable "cache_policy_id" {
  description = "CloudFront cache policy ID"
  type        = string
}

variable "response_headers_policy_id" {
  description = "CloudFront response headers policy ID"
  type        = string
}

variable "default_root_object" {
  description = "Default root object for CloudFront"
  type        = string
  default     = "index.html"
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_All"
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}