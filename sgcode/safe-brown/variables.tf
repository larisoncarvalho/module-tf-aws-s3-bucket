variable "region" {
  type        = string
  description = "AWS region"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID where instance will be launched"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs"
}