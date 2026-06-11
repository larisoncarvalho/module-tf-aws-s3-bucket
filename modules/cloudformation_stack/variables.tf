variable "name" {
  type        = string
  description = "Name of the CloudFormation stack"
}

variable "disable_rollback" {
  type        = bool
  description = "Whether to disable rollback on stack creation failure"
}