# Name and key arrive
# sensitive bytes kept secret—
# trust is declared here

variable "key_name" {
  type        = string
  description = "Name of the key pair"
}

variable "public_key" {
  type        = string
  description = "Public key material"
  sensitive   = true
}