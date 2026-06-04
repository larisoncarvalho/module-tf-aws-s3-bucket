# Variables for the key_pair module.

variable "key_name" {
  description = "Name of the EC2 key pair."
  type        = string
}

variable "public_key" {
  description = "Public key material. Write-only; not returned by AWS after creation. Provide a placeholder – ignored after import."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to assign to the key pair."
  type        = map(string)
  default     = {}
}
