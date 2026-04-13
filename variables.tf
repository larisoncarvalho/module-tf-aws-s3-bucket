variable "region" {
  description = "AWS region"
  type        = string
}

variable "cloudformation_stack_name" {
  description = "CloudFormation stack name"
  type        = string
}

variable "cloudformation_stack_disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}