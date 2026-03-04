variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
}

variable "iam_role_name" {
  description = "Name of IAM role for EC2 instances"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of IAM instance profile"
  type        = string
}

variable "iam_role_path" {
  description = "Path for IAM resources"
  type        = string
  default     = "/"
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "security_group_description" {
  description = "Security group description"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.medium"
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for instance"
  type        = string
}

variable "instance_name" {
  description = "Name tag for instance"
  type        = string
}