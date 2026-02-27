variable "aliases" {
  description = "Domain aliases for the CloudFront distribution"
  type        = list(string)
}

variable "comment" {
  description = "Comment to describe the distribution"
  type        = string
}

variable "s3_origin_domain" {
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

variable "cache_policy_id" {
  description = "Cache policy ID for default cache behavior"
  type        = string
}

variable "function_arn" {
  description = "CloudFront function ARN for viewer request"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM certificate ARN for HTTPS"
  type        = string
}

variable "price_class" {
  description = "Price class for CloudFront distribution"
  type        = string
  default     = "PriceClass_All"
}

variable "default_root_object" {
  description = "Default root object for the distribution"
  type        = string
  default     = "/index.html"
}