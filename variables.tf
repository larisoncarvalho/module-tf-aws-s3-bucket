variable "region" {
  description = "AWS region"
  type        = string
}

variable "ec2_instances" {
  description = "Map of EC2 instance configurations"
  type = map(object({
    ami_id                             = string
    instance_type                      = string
    availability_zone                  = string
    key_name                           = string
    subnet_id                          = string
    vpc_security_group_ids             = list(string)
    source_dest_check                  = bool
    ebs_optimized                      = bool
    monitoring                         = bool
    tenancy                            = string
    hibernation                        = bool
    enclave_enabled                    = bool
    metadata_http_endpoint             = string
    metadata_http_tokens               = string
    metadata_http_put_response_hop_limit = number
    metadata_instance_metadata_tags    = string
    capacity_reservation_preference    = string
    root_delete_on_termination         = bool
  }))
}