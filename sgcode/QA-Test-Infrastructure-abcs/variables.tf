variable "vpcs" {
  description = "Map of VPC configurations"
  type = map(object({
    cidr_block           = string
    instance_tenancy     = optional(string, "default")
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, false)
    tags                 = optional(map(string), {})
  }))
  default = {}
}

variable "subnets" {
  description = "Map of subnet configurations"
  type = map(object({
    vpc_id                  = string
    cidr_block              = string
    availability_zone       = optional(string, null)
    map_public_ip_on_launch = optional(bool, false)
    tags                    = optional(map(string), {})
  }))
  default = {}
}

variable "security_groups" {
  description = "Map of security group configurations"
  type = map(object({
    name        = string
    description = string
    vpc_id      = string
    ingress_rules = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), [])
    })), [])
    egress_rules = optional(list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), [])
    })), [])
    tags = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  description = "Map of network interface configurations"
  type = map(object({
    subnet_id         = string
    private_ip        = optional(string, null)
    security_groups   = optional(list(string), [])
    source_dest_check = optional(bool, true)
    description       = optional(string, "")
    tags              = optional(map(string), {})
  }))
  default = {}
}

variable "instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami                    = string
    instance_type          = string
    subnet_id              = string
    key_name               = optional(string, null)
    vpc_security_group_ids = optional(list(string), [])
    iam_instance_profile   = optional(string, null)
    monitoring             = optional(bool, false)
    ebs_optimized          = optional(bool, false)
    source_dest_check      = optional(bool, true)
    user_data              = optional(string, null)
    metadata_options = optional(object({
      http_endpoint               = optional(string, "enabled")
      http_tokens                 = optional(string, "optional")
      http_put_response_hop_limit = optional(number, 1)
      instance_metadata_tags      = optional(string, "disabled")
    }), null)
    root_block_device = optional(object({
      delete_on_termination = optional(bool, true)
      volume_type           = optional(string, null)
      volume_size           = optional(number, null)
    }), null)
    tags = optional(map(string), {})
  }))
  default = {}
}
