variable "key_name" {
  type        = string
  description = "Key pair name"
}

variable "public_key" {
  type        = string
  default     = ""
  description = "Public key material (write-only)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags"
}
