variable "key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}

variable "public_key" {
  type        = string
  description = "Public key material for the key pair (required by Terraform; not stored in AWS after creation — must be supplied at apply time)"
}