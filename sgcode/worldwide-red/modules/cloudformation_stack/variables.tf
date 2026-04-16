variable "name" {
  description = "Stack name"
  type        = string
}

variable "disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}

variable "tags" {
  description = "Map of resource tags to associate with this stack"
  type        = map(string)
}