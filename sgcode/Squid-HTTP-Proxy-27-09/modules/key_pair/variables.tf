variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "public_key" {
  description = "Public key material (write-only, not returned by API)"
  type        = string
  default     = ""
  sensitive   = true
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
