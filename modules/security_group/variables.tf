variable "group_name" {
  type        = string
  description = "Security group name"
}

variable "description" {
  type        = string
  description = "Security group description"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID for the security group"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the security group"
}