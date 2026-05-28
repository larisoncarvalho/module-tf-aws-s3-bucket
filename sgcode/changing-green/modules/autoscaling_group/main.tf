resource "aws_autoscaling_group" "this" {
  name                      = var.name
  max_size                  = var.max_size
  min_size                  = var.min_size
  desired_capacity          = var.desired_capacity
  default_cooldown          = var.default_cooldown
  default_instance_warmup   = var.default_instance_warmup
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = var.health_check_type
  capacity_rebalance        = var.capacity_rebalance
  metrics_granularity       = var.metrics_granularity
  protect_from_scale_in     = var.protect_from_scale_in
  service_linked_role_arn   = var.service_linked_role_arn
  vpc_zone_identifier       = var.vpc_zone_identifier

  launch_template {
    id      = var.launch_template_id
    name    = var.launch_template_name
    version = var.launch_template_version
  }

  availability_zone_distribution {
    capacity_distribution_strategy = var.capacity_distribution_strategy
  }

  capacity_reservation_specification {
    capacity_reservation_preference = var.capacity_reservation_preference
  }

  tag {
    key                 = "Name"
    value               = var.name
    propagate_at_launch = true
  }
}