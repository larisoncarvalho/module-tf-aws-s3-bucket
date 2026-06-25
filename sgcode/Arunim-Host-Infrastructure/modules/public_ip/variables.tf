variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "allocation_method" {
  type = string
}

variable "sku" {
  type    = string
  default = "Basic"
}

variable "ip_version" {
  type    = string
  default = "IPv4"
}

variable "tags" {
  type    = map(string)
  default = {}
}
