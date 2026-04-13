variable "region" {
  type        = string
  description = "AWS region to deploy resources"
}

variable "cloudformation_stack_name" {
  type        = string
  description = "The name of the CloudFormation stack"
}

variable "cloudformation_stack_disable_rollback" {
  type        = bool
  description = "Whether to disable rollback on stack creation failure"
}