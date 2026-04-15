variable "region" {
  type        = string
  description = "AWS region"
}

variable "neha_private_runner_asg" {
  type = object({
    name                      = string
    max_size                  = number
    min_size                  = number
    desired_capacity          = number
    default_cooldown          = number
    health_check_grace_period = number
    health_check_type         = string
    vpc_zone_identifier       = list(string)
    termination_policies      = list(string)
    launch_template_id        = string
    launch_template_version   = string
  })
  description = "Auto Scaling Group configuration"
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
    metadata_options = object({
      http_endpoint               = string
      http_tokens                 = string
      http_put_response_hop_limit = number
      instance_metadata_tags      = string
    })
  }))
  description = "EC2 instance configurations"
}