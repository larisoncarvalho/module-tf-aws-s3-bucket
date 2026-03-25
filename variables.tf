variable "region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "subnet_id" {
  type        = string
  description = "VPC subnet ID for instance placement"
}

variable "security_group_ids" {
  type        = list(string)
  description = "Security group IDs to attach to the instance"
}