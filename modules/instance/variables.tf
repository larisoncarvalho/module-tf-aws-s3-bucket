variable "instances" {
  description = "EC2 instances to create"
  type = map(object({
    ami_id                   = string
    instance_type            = string
    availability_zone        = string
    key_name                 = string
    ebs_optimized            = bool
    monitoring               = bool
    tenancy                  = string
    subnet_id                = string
    vpc_security_group_ids   = list(string)
    source_dest_check        = bool
    private_ip               = string
    metadata_options = object({
      http_endpoint               = string
      http_tokens                 = string
      http_put_response_hop_limit = number
      instance_metadata_tags      = string
    })
    root_block_device = object({
      volume_type           = string
      delete_on_termination = bool
    })
    tags = map(string)
  }))
}