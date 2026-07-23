variable "vault_name" {
  type        = string
  description = "Name of the backup vault"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key for encryption"
}

variable "vault_policy" {
  type        = string
  description = "JSON policy document for the vault"
}