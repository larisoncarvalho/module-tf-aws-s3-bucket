module "iam_role" {
  source = "./modules/iam_role"

  assume_role_policy_document = {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "autoscaling.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  }
  attached_policy_arns = [
    "arn:aws:iam::aws:policy/aws-service-role/AutoScalingServiceRolePolicy"
  ]
  max_session_duration = 3600
  role_description     = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
  role_name            = "AWSServiceRoleForAutoScaling"
  role_path            = "/aws-service-role/autoscaling.amazonaws.com/"
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  asg_name                                 = "ecs-instances-admin-workflow-qa"
  default_cooldown                         = 300
  desired_capacity                         = 1
  enabled_metrics                          = [
    "WarmPoolPendingCapacity",
    "GroupTerminatingInstances",
    "GroupInServiceInstances",
    "WarmPoolMinSize",
    "GroupMinSize",
    "WarmPoolTotalCapacity",
    "GroupPendingCapacity",
    "GroupStandbyInstances",
    "GroupTerminatingCapacity",
    "GroupDesiredCapacity",
    "GroupTotalInstances",
    "GroupInServiceCapacity",
    "GroupStandbyCapacity",
    "GroupTotalCapacity",
    "WarmPoolWarmedCapacity",
    "WarmPoolTerminatingCapacity",
    "GroupAndWarmPoolDesiredCapacity",
    "GroupMaxSize",
    "WarmPoolDesiredCapacity",
    "GroupPendingInstances",
    "GroupAndWarmPoolTotalCapacity"
  ]
  health_check_grace_period                = 150
  health_check_type                        = "EC2"
  launch_template_id                       = var.launch_template_id
  launch_template_version                  = "$Latest"
  max_size                                 = 1
  min_size                                 = 0
  new_instances_protected_from_scale_in    = false
  service_linked_role_arn                  = module.iam_role.role_arn
  tags                                     = {
    Resource-Type = "nonprod"
    Name          = "ecs-instances-admin-workflow-qa"
  }
  termination_policies                     = ["Default"]
  vpc_zone_identifier                      = [var.subnet_id]
}