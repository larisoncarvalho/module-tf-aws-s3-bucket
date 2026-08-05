variable "key_name" {
  type        = string
  description = "Name of the SSH key pair"
}

variable "public_key" {
  type        = string
  description = "Public key material for the key pair"
  sensitive   = true
}