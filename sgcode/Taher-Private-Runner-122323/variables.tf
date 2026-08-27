variable "instances" {
  type = map(object({
    ami_id                      = string
    instance_type               = string
    key_name                    = string
    subnet_id                   = string
    vpc_security_group_ids      = list(string)
    availability_zone           = string
    associate_public_ip_address = optional(bool, false)
    source_dest_check           = optional(bool, true)
    ebs_optimized               = optional(bool, false)
    monitoring                  = optional(bool, false)
    root_block_device = optional(object({
      volume_type           = optional(string, "gp2")
      volume_size           = optional(number, 8)
      delete_on_termination = optional(bool, true)
      encrypted             = optional(bool, false)
    }), {})
    metadata_options = optional(object({
      http_endpoint               = optional(string, "enabled")
      http_tokens                 = optional(string, "optional")
      http_put_response_hop_limit = optional(number, 1)
      instance_metadata_tags      = optional(string, "disabled")
    }), {})
    tags = optional(map(string), {})
  }))
  default     = {}
  description = "Map of EC2 instances"
}

variable "ebs_volumes" {
  type = map(object({
    availability_zone    = string
    size                 = number
    type                 = optional(string, "gp2")
    iops                 = optional(number, null)
    throughput           = optional(number, null)
    encrypted            = optional(bool, false)
    snapshot_id          = optional(string, null)
    multi_attach_enabled = optional(bool, false)
    tags                 = optional(map(string), {})
  }))
  default     = {}
  description = "Map of EBS volumes"
}

variable "key_pairs" {
  type = map(object({
    key_name   = string
    public_key = optional(string, "")
    tags       = optional(map(string), {})
  }))
  default     = {}
  description = "Map of key pairs"
}

variable "network_interfaces" {
  type = map(object({
    subnet_id         = string
    private_ips       = optional(list(string), [])
    security_groups   = optional(list(string), [])
    description       = optional(string, "")
    source_dest_check = optional(bool, true)
    tags              = optional(map(string), {})
  }))
  default     = {}
  description = "Map of network interfaces"
}
