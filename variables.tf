variable "region" {
  type        = string
  description = "AWS region"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key used for vault encryption"
}