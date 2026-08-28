variable "instances" {
  description = "Map of EC2 instances to manage"
  type = map(object({
    ami                    = string
    instance_type          = string
    key_name               = optional(string)
    subnet_id              = optional(string)
    vpc_security_group_ids = optional(list(string), [])
    source_dest_check      = optional(bool, true)
    ebs_optimized          = optional(bool, false)
    monitoring             = optional(bool, false)
    tenancy                = optional(string, "default")
    availability_zone      = optional(string)
    tags                   = optional(map(string), {})
    root_block_device = optional(object({
      volume_type           = optional(string)
      volume_size           = optional(number)
      delete_on_termination = optional(bool, true)
      encrypted             = optional(bool, false)
    }), null)
    metadata_options = optional(object({
      http_endpoint               = optional(string, "enabled")
      http_tokens                 = optional(string, "optional")
      http_put_response_hop_limit = optional(number, 1)
      instance_metadata_tags      = optional(string, "disabled")
    }), null)
  }))
  default = {}
}

variable "ebs_volumes" {
  description = "Map of EBS volumes to manage"
  type = map(object({
    availability_zone    = string
    size                 = number
    type                 = optional(string, "gp2")
    iops                 = optional(number)
    throughput           = optional(number)
    encrypted            = optional(bool, false)
    snapshot_id          = optional(string)
    multi_attach_enabled = optional(bool, false)
    tags                 = optional(map(string), {})
  }))
  default = {}
}


variable "network_interfaces" {
  description = "Map of network interfaces to manage"
  type = map(object({
    subnet_id         = string
    security_groups   = optional(list(string), [])
    description       = optional(string, "")
    private_ips       = optional(list(string), [])
    source_dest_check = optional(bool, true)
    tags              = optional(map(string), {})
  }))
  default = {}
}
