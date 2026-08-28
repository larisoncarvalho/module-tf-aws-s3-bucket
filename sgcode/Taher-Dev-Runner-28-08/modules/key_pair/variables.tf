variable "key_name" {
  type = string
}

variable "public_key" {
  type      = string
  sensitive = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
