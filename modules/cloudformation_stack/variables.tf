variable "name" {
  type        = string
  description = "Name of the CloudFormation stack"
}

variable "disable_rollback" {
  type        = bool
  description = "Whether to disable rollback of the stack if stack creation failed"
}