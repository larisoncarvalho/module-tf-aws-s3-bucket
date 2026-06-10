variable "key_name" {
  type = string
}

variable "public_key" {
  type      = string
  sensitive = false
  default   = "placeholder"
}

variable "tags" {
  type    = map(string)
  default = {}
}
