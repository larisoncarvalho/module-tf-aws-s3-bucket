variable "region" {
  type        = string
  description = "AWS region"
}

variable "neha_private_runner_asg" {
  type = object({
    name                                  = string
    availability_zones                    = list(string)
    default_cooldown                      = number
    desired_capacity                      = number
    health_check_grace_period             = number
    health_check_type                     = string
    max_size                              = number
    min_size                              = number
    new_instances_protected_from_scale_in = bool
    service_linked_role_arn               = string
    termination_policies                  = list(string)
    vpc_zone_identifier                   = string
    launch_template_id                    = string
    launch_template_version               = string
  })
  description = "Configuration for Neha Private Runner Auto Scaling Group"
}

variable "ec2_instances" {
  type = map(object({
    ami                         = string
    instance_type               = string
    availability_zone           = string
    key_name                    = string
    subnet_id                   = string
    vpc_security_group_ids      = list(string)
    associate_public_ip_address = bool
    source_dest_check           = bool
    ebs_optimized               = bool
    monitoring                  = bool
    tenancy                     = string
  }))
  description = "Map of EC2 instances to create"
}