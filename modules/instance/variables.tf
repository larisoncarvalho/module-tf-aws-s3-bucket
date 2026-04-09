variable "instances" {
  description = "EC2 instances to create"
  type = map(object({
    ami_id                               = string
    instance_type                        = string
    availability_zone                    = string
    key_name                             = optional(string)
    subnet_id                            = optional(string)
    security_group_ids                   = optional(list(string))
    associate_public_ip_address          = optional(bool)
    source_dest_check                    = optional(bool)
    ebs_optimized                        = bool
    monitoring                           = bool
    tenancy                              = string
    hibernation                          = bool
    enclave_enabled                      = bool
    metadata_http_endpoint               = string
    metadata_http_tokens                 = string
    metadata_http_put_response_hop_limit = number
    metadata_http_protocol_ipv6          = string
    metadata_instance_metadata_tags      = string
    capacity_reservation_preference      = string
    cpu_core_count                       = number
    cpu_threads_per_core                 = number
    root_volume_type                     = optional(string)
    root_delete_on_termination           = optional(bool)
    tags                                 = map(string)
  }))
}