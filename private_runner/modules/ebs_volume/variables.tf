variable "availability_zone" {
  type = string
}

variable "size" {
  type = number
}

variable "volume_type" {
  type = string
}

variable "iops" {
  type    = number
  default = null
}

variable "throughput" {
  type    = number
  default = null
}

variable "encrypted" {
  type    = bool
  default = false
}

variable "multi_attach_enabled" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
