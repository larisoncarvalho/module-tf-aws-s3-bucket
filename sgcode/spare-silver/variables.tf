variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_vpc_name" {
  type = object({
    cidr_block       = string
    instance_tenancy = string
    tags             = map(string)
  })
  description = "VPC configuration for vpc_vpc_name"
}

variable "subnet_vpc_name_public_eu_central_1a" {
  type = object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = bool
    tags                    = map(string)
  })
  description = "Subnet configuration for vpc_name-public-eu-central-1a"
}

variable "security_group_6y8ixgma" {
  type = object({
    name        = string
    description = string
    rules = map(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  })
  description = "Security group configuration for 6y8ixgma"
}

variable "instance_6y8ixgma" {
  type = object({
    ami               = string
    instance_type     = string
    availability_zone = string
    key_name          = string
    source_dest_check = bool
    ebs_optimized     = bool
    monitoring        = bool
    ebs_volume_size   = number
    ebs_volume_type   = string
    ebs_volume_iops   = number
    ebs_snapshot_id   = string
    ebs_encrypted     = bool
    ebs_device_name   = string
  })
  description = "EC2 instance configuration for 6y8ixgma"
}