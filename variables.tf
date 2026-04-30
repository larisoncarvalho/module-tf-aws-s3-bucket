variable "region" {
  type        = string
  description = "AWS region"
}

variable "name" {
  type        = string
  description = "CloudFormation stack name"
}

variable "disable_rollback" {
  type        = bool
  description = "Set to true to disable rollback of the stack if stack creation failed"
