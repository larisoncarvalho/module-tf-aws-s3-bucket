variable "region" {
  type        = string
  description = "AWS region for resources"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the instance and network interface"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs for the instance and network interface"
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for the SSH key pair"
  sensitive   = true
}