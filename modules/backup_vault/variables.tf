variable "vault_name" {
  type        = string
  description = "Name of the backup vault"
}

variable "kms_key_arn" {
  type        = string
  description = "ARN of the KMS key used for vault encryption"
}

variable "vault_policy" {
  type = object({
    Version = string
    Statement = list(object({
      Effect    = string
      Principal = any
      Action    = any
      Resource  = string
      Condition = optional(map(any))
    }))
  })
  description = "IAM policy document for vault access control"
}