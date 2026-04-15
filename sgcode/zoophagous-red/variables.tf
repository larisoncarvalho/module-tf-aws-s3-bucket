variable "region" {
  description = "AWS region"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "public_key" {
  description = "Public key material for the key pair"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID for the instance"
  type        = string
}

variable "security_group_ids" {
  description = "Security group IDs"
  type        = list(string)
}

variable "root_volume_type" {
  description = "Root volume type"
  type        = string
}

variable "root_volume_size" {
  description = "Root volume size in GB"
  type        = number
}