variable "region" {
  type        = string
  description = "AWS region for resource deployment"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where subnet will be created"
}