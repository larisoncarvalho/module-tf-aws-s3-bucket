variable "region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for the EC2 instance"
}

variable "security_group_ids" {
  type        = list(string)
  description = "List of security group IDs to attach to the instance"
}

variable "root_volume_type" {
  type        = string
  description = "Type of root block device volume"
}