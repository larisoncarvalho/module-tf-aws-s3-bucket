variable "region" {
  type        = string
  description = "AWS region for resources"
}

variable "backup_vault_kms_key_arn" {
  type        = string
  description = "KMS key ARN for backup vault encryption"
}

variable "taher_runner_subnet_id" {
  type        = string
  description = "Subnet ID for Taher runner autoscaling group"
}

variable "taher_runner_launch_template_id" {
  type        = string
  description = "Launch template ID for Taher runner"
}

variable "autoscaling_service_linked_role_arn" {
  type        = string
  description = "Service-linked role ARN for autoscaling"
}

variable "instance_ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "instance_key_name" {
  type        = string
  description = "SSH key name for EC2 instance"
}

variable "instance_security_group_id" {
  type        = string
  description = "Security group ID for EC2 instance"
}

variable "instance_subnet_id" {
  type        = string
  description = "Subnet ID for EC2 instance"
}

variable "eni_subnet_id" {
  type        = string
  description = "Subnet ID for network interface"
}

variable "eni_security_group_id" {
  type        = string
  description = "Security group ID for network interface"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for resources"
}