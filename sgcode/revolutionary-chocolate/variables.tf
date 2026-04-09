variable "key_pair_public_key" {
  description = "Public key material for taher-private-runner key pair"
  type        = string
  sensitive   = true
}

variable "region" {
  description = "AWS region"
  type        = string
}