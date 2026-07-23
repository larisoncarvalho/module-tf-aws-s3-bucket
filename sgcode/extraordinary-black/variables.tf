variable "region" {
  type        = string
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs"
}

variable "root_volume_type" {
  type        = string
  description = "Root volume type"
}

variable "public_key" {
  type        = string
  description = "Public key material for key pair"
}