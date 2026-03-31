variable "ami" {
  description = "AMI ID for the instance"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instance network interface"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group IDs to attach to the instance"
  type        = list(string)
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}