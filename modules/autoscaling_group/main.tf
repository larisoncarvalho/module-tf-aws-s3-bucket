resource "aws_autoscaling_group" "this" {
  name                                  = var.name
  availability_zones                    = var.availability_zones
  default_cooldown                      = var.default_cooldown
  desired_capacity                      = var.desired_capacity
  health_check_grace_period             = var.health_check_grace_period
  health_check_type                     = var.health_check_type
  max_size                              = var.max_size
  min_size                              = var.min_size
  new_instances_protected_from_scale_in = var.new_instances_protected_from_scale_in
  service_linked_role_arn               = var.service_linked_role_arn
  termination_policies                  = var.termination_policies
  vpc_zone_identifier                   = [var.vpc_zone_identifier]

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }
}