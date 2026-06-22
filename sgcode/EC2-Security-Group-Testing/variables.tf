variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    availability_zone      = string
    source_dest_check      = optional(bool, true)
    ebs_optimized          = optional(bool, false)
    monitoring             = optional(bool, false)
    tags                   = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  type = map(object({
    subnet_id         = string
    security_groups   = list(string)
    private_ip        = optional(string, "")
    source_dest_check = optional(bool, true)
    description       = optional(string, "")
    tags              = optional(map(string), {})
  }))
  default = {}
}
