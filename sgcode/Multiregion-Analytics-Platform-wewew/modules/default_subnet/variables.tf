variable "availability_zone" {
  type = string
}

variable "map_public_ip_on_launch" {
  type    = bool
  default = true
}

variable "tags" {
  type    = map(string)
  default = {}
}
