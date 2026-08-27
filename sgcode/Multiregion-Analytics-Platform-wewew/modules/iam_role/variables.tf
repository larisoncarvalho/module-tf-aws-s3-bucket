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

variable "assume_role_policy" {
  type = string
}

variable "max_session_duration" {
  type    = number
  default = 3600
}
