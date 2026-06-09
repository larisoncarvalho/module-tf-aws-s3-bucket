variable "region" {
  type        = string
  description = "AWS region"
}

variable "cloudformation_stack_name" {
  type        = string
  description = "The name of the CloudFormation stack"
}

variable "cloudformation_stack_disable_rollback" {
  type        = bool
  description = "Set to true to disable rollback of the stack if stack creation failed"
}

variable "internet_gateway_vpc_id" {
  type        = string
  description = "The VPC ID to attach the internet gateway to"
}