variable "region" {
  type        = string
  description = "AWS region for resources"
}

variable "ec2_instances" {
  type = map(object({
    ami                         = string
    instance_type               = string
    availability_zone           = string
    key_name                    = string
    vpc_security_group_ids      = list(string)
    subnet_id                   = string
    associate_public_ip_address = bool
    source_dest_check           = bool
    ebs_optimized               = bool
    monitoring                  = bool
    tenancy                     = string
  }))
  description = "Map of EC2 instance configurations"
}