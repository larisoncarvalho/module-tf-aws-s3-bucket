variable "key_name" {
  type        = string
  description = "The name of the key pair"
}

variable "public_key" {
  type        = string
  description = "The public key material (write-only)"
  sensitive   = true
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the key pair"
  default     = {}
}
