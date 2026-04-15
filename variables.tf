variable "region" {
  type        = string
  description = "AWS region"
}

variable "ec2_taher_private_runner_ubuntu" {
  type = object({
    ami                     = string
    instance_type           = string
    availability_zone       = string
    key_name                = string
    subnet_id               = string
    vpc_security_group_ids  = list(string)
    ebs_optimized           = bool
    monitoring              = bool
    source_dest_check       = bool
    tenancy                 = string
    metadata_options = object({
      http_endpoint               = string
      http_protocol_ipv6          = string
      http_put_response_hop_limit = number
      http_tokens                 = string
      instance_metadata_tags      = string
    })
    enclave_options_enabled = bool
    cpu_core_count          = number
    cpu_threads_per_core    = number
  })
  description = "Configuration for EC2 instance taher-private-runner-ubuntu"
}