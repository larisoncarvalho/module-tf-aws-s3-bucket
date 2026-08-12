variable "name" {
  type = string
}

variable "disable_rollback" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
