variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "ami_id" {
  type    = string
  default = "ami-03250b0e01c28d196"
}

variable "subnet_id" {
  type    = string
  default = "subnet-072669658da496c4a"
}

variable "security_group_ids" {
  type    = list(string)
  default = ["sg-092a5ff991a0802bc"]
}

variable "root_volume_type" {
  type    = string
  default = "gp2"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for SSH key pair"
}