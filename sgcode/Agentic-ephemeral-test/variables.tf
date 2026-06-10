variable "key_pairs" {
  type = map(object({
    key_name   = string
    public_key = optional(string, "placeholder")
    tags       = optional(map(string), {})
  }))
  default = {}
}

variable "ebs_volumes" {
  type = map(object({
    availability_zone    = string
    size                 = number
    type                 = optional(string, "gp2")
    iops                 = optional(number, null)
    throughput           = optional(number, null)
    encrypted            = optional(bool, false)
    multi_attach_enabled = optional(bool, false)
    snapshot_id          = optional(string, null)
    tags                 = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  type = map(object({
    subnet_id         = string
    private_ips       = optional(list(string), [])
    security_groups   = optional(list(string), [])
    source_dest_check = optional(bool, true)
    description       = optional(string, "")
    tags              = optional(map(string), {})
  }))
  default = {}
}

variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    key_name               = optional(string, null)
    subnet_id              = optional(string, null)
    vpc_security_group_ids = optional(list(string), [])
    source_dest_check      = optional(bool, true)
    ebs_optimized          = optional(bool, false)

    root_volume_type                  = optional(string, "gp2")
    root_volume_size                  = optional(number, 8)
    root_volume_iops                  = optional(number, null)
    root_volume_throughput            = optional(number, null)
    root_volume_delete_on_termination = optional(bool, true)
    root_volume_encrypted             = optional(bool, false)

    metadata_http_endpoint               = optional(string, "enabled")
    metadata_http_tokens                 = optional(string, "optional")
    metadata_http_put_response_hop_limit = optional(number, 1)
    metadata_http_protocol_ipv6          = optional(string, "disabled")
    metadata_instance_metadata_tags      = optional(string, "disabled")

    tags = optional(map(string), {})
  }))
  default = {}
}
