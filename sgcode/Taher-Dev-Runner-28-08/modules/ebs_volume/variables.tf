variable "availability_zone" {
  type = string
}

variable "size" {
  type = number
}

variable "type" {
  type    = string
  default = "gp2"
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

variable "snapshot_id" {
  type    = string
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
