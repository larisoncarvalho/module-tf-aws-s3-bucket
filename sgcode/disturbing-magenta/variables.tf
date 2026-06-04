# Root input variables. Each map entry corresponds to one discovered cloud resource.
# Add or remove entries in environments/sg.tfvars to scale without touching .tf code.

variable "instances" {
  description = "Map of EC2 instance configurations keyed by sanitised Name tag."
  type = map(object({
    ami                                  = string
    instance_type                        = string
    key_name                             = string
    subnet_id                            = string
    vpc_security_group_ids               = list(string)
    availability_zone                    = string
    monitoring                           = bool
    ebs_optimized                        = bool
    source_dest_check                    = bool
    tenancy                              = string
    metadata_http_endpoint               = string
    metadata_http_put_response_hop_limit = number
    metadata_http_tokens                 = string
    metadata_instance_metadata_tags      = string
    metadata_http_protocol_ipv6          = string
    root_delete_on_termination           = bool
    root_volume_type                     = string
    root_volume_size                     = number
    root_iops                            = optional(number, null)
    root_throughput                      = optional(number, null)
    tags                                 = optional(map(string), {})
  }))
  default = {}
}

variable "ebs_volumes" {
  description = "Map of EBS volume configurations keyed by sanitised volume ID."
  type = map(object({
    availability_zone = string
    size              = number
    type              = string
    iops              = optional(number, null)
    throughput        = optional(number, null)
    encrypted         = bool
    snapshot_id       = optional(string, null)
    tags              = optional(map(string), {})
  }))
  default = {}
}

variable "key_pairs" {
  description = "Map of EC2 key pair configurations keyed by sanitised key name."
  type = map(object({
    key_name   = string
    public_key = string
    tags       = optional(map(string), {})
  }))
  default = {}
}

variable "network_interfaces" {
  description = "Map of EC2 network interface configurations keyed by sanitised ENI ID."
  type = map(object({
    subnet_id         = string
    private_ips       = list(string)
    security_groups   = list(string)
    source_dest_check = bool
    description       = optional(string, "")
    tags              = optional(map(string), {})
  }))
  default = {}
}
