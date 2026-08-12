variable "name" {
  type = string
}

variable "path" {
  type    = string
  default = "/"
}

variable "description" {
  type    = string
  default = null
}

variable "max_session_duration" {
  type    = number
  default = 3600
}

variable "assume_role_policy" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
