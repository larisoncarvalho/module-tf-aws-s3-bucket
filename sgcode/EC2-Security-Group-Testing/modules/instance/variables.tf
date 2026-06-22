variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "availability_zone" {
  type = string
}

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "monitoring" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}
