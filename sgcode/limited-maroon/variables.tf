variable "region" {
  description = "AWS region"
  type        = string
}

variable "name" {
  description = "CloudFormation stack name"
  type        = string
}

variable "disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}