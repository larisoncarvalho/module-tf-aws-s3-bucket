variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_sg_nonprod_1" {
  description = "VPC configuration"
  type = object({
    cidr_block       = string
    instance_tenancy = string
    tags             = map(string)
  })
}

variable "subnet_app_a" {
  description = "Subnet configuration"
  type = object({
    cidr_block                      = string
    availability_zone               = string
    map_public_ip_on_launch         = bool
    assign_ipv6_address_on_creation = bool
    ipv6_cidr_block                 = string
    tags                            = map(string)
  })
}

variable "security_group_default" {
  description = "Security group configuration"
  type = object({
    name        = string
    description = string
    tags        = map(string)
    rules = optional(map(object({
      type                     = string
      protocol                 = string
      from_port                = optional(number)
      to_port                  = optional(number)
      cidr_blocks              = optional(list(string))
      ipv6_cidr_blocks         = optional(list(string))
      source_security_group_id = optional(string)
      self                     = optional(bool)
      description              = optional(string)
    })), {})
  })
}

variable "key_pair_nonprod_euc1" {
  description = "Key pair configuration"
  type = object({
    key_name = string
  })
}

variable "iam_role_amazonec2containerserviceforec2role" {
  description = "IAM role configuration"
  type = object({
    name               = string
    path               = string
    assume_role_policy = any
  })
}

variable "iam_instance_profile_amazonec2containerserviceforec2role" {
  description = "IAM instance profile configuration"
  type = object({
    name = string
    path = string
  })
}

variable "ebs_volume_vol_0829d737221ed9b5a" {
  description = "EBS volume configuration"
  type = object({
    availability_zone    = string
    encrypted            = bool
    iops                 = number
    multi_attach_enabled = bool
    size                 = number
    snapshot_id          = string
    volume_type          = string
    tags                 = map(string)
  })
}

variable "network_interface_eni_03f18c266f4ca136e" {
  description = "Network interface configuration"
  type = object({
    private_ips       = list(string)
    source_dest_check = bool
    tags              = map(string)
  })
}

variable "instance_ecs_instances_admin_workflow_qa" {
  description = "EC2 instance configuration"
  type = object({
    ami                                  = string
    instance_type                        = string
    availability_zone                    = string
    ebs_optimized                        = bool
    monitoring                           = bool
    source_dest_check                    = bool
    tenancy                              = string
    root_volume_type                     = string
    root_volume_size                     = number
    root_delete_on_termination           = bool
    metadata_http_endpoint               = string
    metadata_http_put_response_hop_limit = number
    metadata_http_tokens                 = string
    metadata_instance_metadata_tags      = string
    tags                                 = map(string)
  })
}