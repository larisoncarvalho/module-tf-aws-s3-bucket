variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "public_key" {
  description = "Public key material (write-only; ignored after import)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to the key pair"
  type        = map(string)
  default     = {}
}
