variable "instances" {
  type = map(object({
    ami                    = string
    instance_type          = string
    subnet_id              = string
    vpc_security_group_ids = list(string)
    key_name               = string
    iam_instance_profile   = string
    monitoring             = bool
    source_dest_check      = bool
    user_data              = string
    metadata_options = object({
      http_endpoint               = string
      http_tokens                 = string
      http_put_response_hop_limit = number
    })
    root_block_device = object({
      volume_type           = string
      volume_size           = number
      delete_on_termination = bool
    })
    tags = map(string)
  }))
  description = "Map of instances to create"
  default     = {}
}