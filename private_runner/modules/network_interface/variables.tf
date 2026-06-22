variable "subnet_id" {
  type = string
}

variable "private_ips" {
  type    = list(string)
  default = []
}

variable "security_groups" {
  type    = list(string)
  default = []
}

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "description" {
  type    = string
  default = ""
}

variable "tags" {
  type    = map(string)
  default = {}
}
