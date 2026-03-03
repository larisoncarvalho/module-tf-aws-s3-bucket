variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name tag for VPC"
  type        = string
}

variable "iam_role_name" {
  description = "Name of IAM role"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of IAM instance profile"
  type        = string
}

variable "iam_role_path" {
  description = "Path for IAM role"
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

variable "subnet_cidr_block" {
  description = "CIDR block for subnet"
  type        = string
}

variable "subnet_availability_zone" {
  description = "Availability zone for subnet"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type"
  type        = string
}

variable "key_name" {
  description = "SSH key pair name"
  type        = string
}

variable "asg_name" {
  description = "Auto-scaling group name"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances"
  type        = number
}