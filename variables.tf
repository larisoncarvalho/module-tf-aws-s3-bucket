variable "region" {
  description = "AWS region"
  type        = string
}

variable "service_linked_role_arn" {
  description = "ARN of the service linked role for auto scaling"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the auto scaling group"
  type        = string
}