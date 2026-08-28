variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    key_name               = optional(string, null)
    subnet_id              = optional(string, null)
    vpc_security_group_ids = optional(list(string), [])
    source_dest_check      = optional(bool, true)
    monitoring             = optional(bool, false)
    ebs_optimized          = optional(bool, false)
    tags                   = optional(map(string), {})
    metadata_options = optional(object({
      http_endpoint               = optional(string, "enabled")
      http_tokens                 = optional(string, "optional")
      http_put_response_hop_limit = optional(number, 1)
      http_protocol_ipv6          = optional(string, "disabled")
      instance_metadata_tags      = optional(string, "disabled")
    }), null)
    root_block_device = optional(object({
      volume_type           = optional(string, null)
      volume_size           = optional(number, null)
      delete_on_termination = optional(bool, true)
      encrypted             = optional(bool, false)
    }), null)
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

variable "key_pairs" {
  type = map(object({
    key_name = string
    tags     = optional(map(string), {})
  }))
  default = {}
}

variable "key_pair_public_keys" {
  description = "Map of key pair map-key to public key material (write-only, sensitive)"
  type        = map(string)
  sensitive   = true
  default     = {}
}

variable "network_interfaces" {
  type = map(object({
    subnet_id         = string
    security_groups   = optional(list(string), [])
    private_ips       = optional(list(string), [])
    source_dest_check = optional(bool, true)
    description       = optional(string, "")
    tags              = optional(map(string), {})
  }))
  default = {}
}
