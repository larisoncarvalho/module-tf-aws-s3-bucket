variable "name" {
  type = string
}

variable "template_url" {
  type    = string
  default = ""
}

variable "template_body" {
  type    = string
  default = ""
}

variable "capabilities" {
  type    = list(string)
  default = []
}

variable "disable_rollback" {
  type    = bool
  default = false
}

variable "notification_arns" {
  type    = list(string)
  default = []
}

variable "timeout_in_minutes" {
  type    = number
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
