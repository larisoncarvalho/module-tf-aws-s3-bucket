variable "region" {
  description = "AWS region where resources will be managed"
  type        = string
}

variable "bucket" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "tags" {
  description = "Tags to assign to the bucket"
  type        = map(string)
  default     = {}
}