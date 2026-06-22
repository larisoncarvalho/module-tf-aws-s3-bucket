variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "private_ip" {
  type    = string
  default = ""
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
