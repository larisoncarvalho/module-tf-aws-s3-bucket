variable "name" {
  type        = string
  description = "Stack name"
}

variable "disable_rollback" {
  type        = bool
  description = "Whether to disable rollback of the stack if stack creation failed"
}