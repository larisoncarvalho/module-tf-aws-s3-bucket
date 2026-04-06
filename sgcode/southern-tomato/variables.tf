variable "ami_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "root_volume_type" {
  type = string
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for SSH key pair"
}