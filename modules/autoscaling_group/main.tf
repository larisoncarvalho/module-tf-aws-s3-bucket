resource "aws_autoscaling_group" "this" {
  default_cooldown          = var.default_cooldown
  desired_capacity          = var.desired_capacity
  enabled_metrics           = var.enabled_metrics
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  max_size                  = var.max_size
  min_size                  = var.min_size
  name                      = var.asg_name
  protect_from_scale_in     = var.new_instances_protected_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  termination_policies      = var.termination_policies
  vpc_zone_identifier       = var.vpc_zone_identifier

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  dynamic "tag" {
    for_each = var.tags
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }
  }
}