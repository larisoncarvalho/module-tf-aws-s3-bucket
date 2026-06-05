variable "name" {
  description = "Stack name"
  type        = string
}

variable "template_body" {
  description = "Structure containing the template body as a JSON/YAML string"
  type        = string
}

variable "disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}

variable "timeout_in_minutes" {
  description = "The amount of time that can pass before the stack status becomes CREATE_FAILED"
  type        = number
}