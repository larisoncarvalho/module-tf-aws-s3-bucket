variable "key_pairs" {
  type = map(object({
    key_name = string
  }))
  default = {}
}

variable "ebs_volumes" {
  type = map(object({
    availability_zone    = string
    size                 = number
    volume_type          = string
    iops                 = optional(number, null)
    throughput           = optional(number, null)
    encrypted            = optional(bool, false)
    multi_attach_enabled = optional(bool, false)
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
    availability_zone      = optional(string, null)
    tenancy                = optional(string, "default")
    monitoring             = optional(bool, false)
    ebs_optimized          = optional(bool, false)
    source_dest_check      = optional(bool, true)

    root_volume_size                  = optional(number, null)
    root_volume_type                  = optional(string, null)
    root_volume_delete_on_termination = optional(bool, true)

    metadata_http_endpoint               = optional(string, "enabled")
    metadata_http_tokens                 = optional(string, "optional")
    metadata_http_put_response_hop_limit = optional(number, 1)

    cpu_core_count       = optional(number, null)
    cpu_threads_per_core = optional(number, null)

    tags = optional(map(string), {})
  }))
  default = {}
}
