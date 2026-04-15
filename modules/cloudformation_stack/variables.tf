variable "stack_name" {
  type        = string
  description = "Name of the CloudFormation stack"
}

variable "capabilities" {
  type        = list(string)
  description = "List of capabilities required by the stack"
}

variable "disable_rollback" {
  type        = bool
  description = "Whether to disable rollback on stack creation failure"
}

variable "parameters" {
  type        = map(string)
  description = "Map of parameter keys and values for the stack"
}

variable "template_body" {
  type        = string
  description = "CloudFormation template body (JSON or YAML)"
}