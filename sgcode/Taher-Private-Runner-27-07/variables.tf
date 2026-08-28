variable "instances" {
  type = map(object({
    ami                     = string
    instance_type           = string
    subnet_id               = string
    vpc_security_group_ids  = optional(list(string), [])
    key_name                = optional(string)
    availability_zone       = optional(string)
    tenancy                 = optional(string, "default")
    ebs_optimized           = optional(bool, false)
    source_dest_check       = optional(bool, true)
    monitoring              = optional(bool, false)
    hibernation             = optional(bool, false)
    enclave_options_enabled = optional(bool, false)
    root_block_device = optional(object({
      volume_type           = optional(string)
      volume_size           = optional(number)
      iops                  = optional(number)
      throughput            = optional(number)
      delete_on_termination = optional(bool, true)
      encrypted             = optional(bool, false)
    }))
    metadata_options = optional(object({
      http_endpoint               = optional(string, "enabled")
      http_tokens                 = optional(string, "optional")
      http_put_response_hop_limit = optional(number, 1)
      instance_metadata_tags      = optional(string, "disabled")
    }))
    cpu_options = optional(object({
      core_count       = optional(number)
      threads_per_core = optional(number)
    }))
    tags = optional(map(string), {})
  }))
  description = "Map of EC2 instances to create"
  default     = {}
}

variable "ebs_volumes" {
  type = map(object({
    availability_zone    = string
    size                 = number
    volume_type          = optional(string, "gp3")
    iops                 = optional(number)
    throughput           = optional(number)
    encrypted            = optional(bool, false)
    snapshot_id          = optional(string)
    multi_attach_enabled = optional(bool, false)
    tags                 = optional(map(string), {})
  }))
  description = "Map of EBS volumes to create"
  default     = {}
}

variable "key_pairs" {
  type = map(object({
    key_name = string
    tags     = optional(map(string), {})
  }))
  description = "Map of key pairs"
  default     = {}
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
  description = "Map of network interfaces"
  default     = {}
}

variable "key_pair_public_key" {
  type        = string
  description = "Public key material for the key pair (write-only placeholder)"
  sensitive   = true
  default     = ""
}
