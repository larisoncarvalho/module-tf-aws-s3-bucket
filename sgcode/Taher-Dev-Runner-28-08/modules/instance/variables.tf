variable "ami" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type    = string
  default = null
}

variable "subnet_id" {
  type    = string
  default = null
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "source_dest_check" {
  type    = bool
  default = true
}

variable "monitoring" {
  type    = bool
  default = false
}

variable "ebs_optimized" {
  type    = bool
  default = false
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "metadata_options" {
  type = object({
    http_endpoint               = optional(string, "enabled")
    http_tokens                 = optional(string, "optional")
    http_put_response_hop_limit = optional(number, 1)
    http_protocol_ipv6          = optional(string, "disabled")
    instance_metadata_tags      = optional(string, "disabled")
  })
  default = null
}

variable "root_block_device" {
  type = object({
    volume_type           = optional(string, null)
    volume_size           = optional(number, null)
    delete_on_termination = optional(bool, true)
    encrypted             = optional(bool, false)
  })
  default = null
}
