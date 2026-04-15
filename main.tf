module "iam_role" {
  source = "./modules/iam_role"

  name                 = "AWSServiceRoleForAutoScaling"
  path                 = "/aws-service-role/autoscaling.amazonaws.com/"
  description          = "Default Service-Linked Role enables access to AWS Services and Resources used or managed by Auto Scaling"
  max_session_duration = 3600
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
  attached_policy_arns = {
    autoscaling_service_role_policy = var.autoscaling_service_role_policy_arn
  }
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                                  = "ecs-instances-admin-workflow-qa"
  default_cooldown                      = 300
  desired_capacity                      = 1
  health_check_grace_period             = 150
  health_check_type                     = "EC2"
  max_size                              = 1
  min_size                              = 0
  vpc_zone_identifier                   = var.subnet_id
  launch_template_id                    = var.launch_template_id
  launch_template_version               = "$Latest"
  enabled_metrics = [
    "GroupMinSize",
    "GroupStandbyCapacity",
    "WarmPoolMinSize",
    "GroupInServiceInstances",
    "GroupInServiceCapacity",
    "GroupMaxSize",
    "WarmPoolTerminatingCapacity",
    "GroupTerminatingCapacity",
    "WarmPoolWarmedCapacity",
    "GroupTotalCapacity",
    "GroupDesiredCapacity",
    "GroupAndWarmPoolTotalCapacity",
    "GroupPendingCapacity",
    "WarmPoolPendingCapacity",
    "GroupPendingInstances",
    "GroupTotalInstances",
    "GroupAndWarmPoolDesiredCapacity",
    "GroupStandbyInstances",
    "WarmPoolDesiredCapacity",
    "GroupTerminatingInstances",
    "WarmPoolTotalCapacity"
  ]
  termination_policies                  = ["Default"]
  new_instances_protected_from_scale_in = false
  service_linked_role_arn               = module.iam_role.arn
  tags = {
    "Resource-Type" = "nonprod"
    "Name"          = "ecs-instances-admin-workflow-qa"
  }
}