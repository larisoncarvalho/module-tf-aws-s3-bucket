variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = "Managed by Terraform"
}

variable "vpc_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}
