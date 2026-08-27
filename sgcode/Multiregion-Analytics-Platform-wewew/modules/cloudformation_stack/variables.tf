variable "name" {
  type = string
}

variable "disable_rollback" {
  type    = bool
  default = false
}

variable "enable_termination_protection" {
  type    = bool
  default = false
}

variable "template_body" {
  type    = string
  default = null
}
