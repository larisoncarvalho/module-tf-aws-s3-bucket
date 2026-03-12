variable "region" {
  description = "AWS region"
  type        = string
}

variable "ec2_private_runner" {
  description = "EC2 instance configuration for private runner"
  type = object({
    ami_id                 = string
    instance_type          = string
    availability_zone      = string
    key_name               = string
    vpc_security_group_ids = list(string)
    subnet_id              = string
    source_dest_check      = bool
    ebs_optimized          = bool
    monitoring             = bool
    tenancy                = string
    metadata_options = object({
      http_endpoint               = string
      http_tokens                 = string
      http_put_response_hop_limit = number
      http_protocol_ipv6          = string
      instance_metadata_tags      = string
    })
    enclave_options_enabled = bool
    tags                    = map(string)
  })
}