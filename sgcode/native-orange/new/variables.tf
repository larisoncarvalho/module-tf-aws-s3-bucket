variable "region" {
  type        = string
  description = "AWS region"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for SSH access"
  sensitive   = true
}