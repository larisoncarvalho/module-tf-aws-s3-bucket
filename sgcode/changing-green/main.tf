module "apigatewayv2_api" {
  source = "./modules/apigatewayv2_api"

  name                         = var.api_gateway_name
  protocol_type                = var.api_gateway_protocol_type
  api_key_selection_expression = var.api_gateway_api_key_selection_expression
  route_selection_expression   = var.api_gateway_route_selection_expression
  disable_execute_api_endpoint = var.api_gateway_disable_execute_api_endpoint
}

module "athena_workgroup" {
  source = "./modules/athena_workgroup"

  name                               = var.athena_workgroup_name
  state                              = var.athena_workgroup_state
  enforce_workgroup_configuration    = var.athena_enforce_workgroup_configuration
  publish_cloudwatch_metrics_enabled = var.athena_publish_cloudwatch_metrics_enabled
  requester_pays_enabled             = var.athena_requester_pays_enabled
  selected_engine_version            = var.athena_selected_engine_version
}

module "autoscaling_group" {
  source = "./modules/autoscaling_group"

  name                            = var.asg_name
  max_size                        = var.asg_max_size
  min_size                        = var.asg_min_size
  desired_capacity                = var.asg_desired_capacity
  health_check_grace_period       = var.asg_health_check_grace_period
  health_check_type               = var.asg_health_check_type
  default_cooldown                = var.asg_default_cooldown
  default_instance_warmup         = var.asg_default_instance_warmup
  protect_from_scale_in           = var.asg_protect_from_scale_in
  capacity_rebalance              = var.asg_capacity_rebalance
  metrics_granularity             = var.asg_metrics_granularity
  service_linked_role_arn         = var.asg_service_linked_role_arn
  vpc_zone_identifier             = var.asg_vpc_zone_identifier
  launch_template_id              = var.asg_launch_template_id
  launch_template_name            = var.asg_launch_template_name
  launch_template_version         = var.asg_launch_template_version
  capacity_distribution_strategy  = var.asg_capacity_distribution_strategy
  capacity_reservation_preference = var.asg_capacity_reservation_preference
}

module "cloudformation_stack" {
  source = "./modules/cloudformation_stack"

  cloudformation_stacks = var.cloudformation_stacks
}

module "config_config_rule" {
  source = "./modules/config_config_rule"

  config_rules = var.config_rules
}