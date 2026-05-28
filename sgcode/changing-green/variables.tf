variable "region" {
  type        = string
  description = "AWS region"
}

variable "api_gateway_name" {
  type        = string
  description = "Name of the API Gateway v2 API"
}

variable "api_gateway_protocol_type" {
  type        = string
  description = "API protocol type (HTTP or WEBSOCKET)"
}

variable "api_gateway_api_key_selection_expression" {
  type        = string
  description = "API key selection expression"
}

variable "api_gateway_route_selection_expression" {
  type        = string
  description = "Route selection expression"
}

variable "api_gateway_disable_execute_api_endpoint" {
  type        = bool
  description = "Whether to disable the default execute-api endpoint"
}

variable "athena_workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "athena_workgroup_state" {
  type        = string
  description = "State of the workgroup (ENABLED or DISABLED)"
}

variable "athena_enforce_workgroup_configuration" {
  type        = bool
  description = "Whether workgroup settings override client-side settings"
}

variable "athena_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether CloudWatch metrics are enabled for the workgroup"
}

variable "athena_requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays is enabled"
}

variable "athena_selected_engine_version" {
  type        = string
  description = "Selected Athena engine version"
}

variable "asg_name" {
  type        = string
  description = "Name of the Auto Scaling group"
}

variable "asg_max_size" {
  type        = number
  description = "Maximum size of the Auto Scaling group"
}

variable "asg_min_size" {
  type        = number
  description = "Minimum size of the Auto Scaling group"
}

variable "asg_desired_capacity" {
  type        = number
  description = "Desired number of EC2 instances in the group"
}

variable "asg_health_check_grace_period" {
  type        = number
  description = "Time in seconds after instance launch before health checks begin"
}

variable "asg_health_check_type" {
  type        = string
  description = "Health check type (EC2 or ELB)"
}

variable "asg_default_cooldown" {
  type        = number
  description = "Default cooldown period in seconds"
}

variable "asg_default_instance_warmup" {
  type        = number
  description = "Default instance warmup period in seconds"
}

variable "asg_protect_from_scale_in" {
  type        = bool
  description = "Whether newly launched instances are protected from scale-in"
}

variable "asg_capacity_rebalance" {
  type        = bool
  description = "Whether capacity rebalance is enabled"
}

variable "asg_metrics_granularity" {
  type        = string
  description = "Granularity for metrics collection"
}

variable "asg_service_linked_role_arn" {
  type        = string
  description = "ARN of the service-linked role for the ASG"
}

variable "asg_vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet IDs for the ASG"
}

variable "asg_launch_template_id" {
  type        = string
  description = "ID of the launch template"
}

variable "asg_launch_template_name" {
  type        = string
  description = "Name of the launch template"
}

variable "asg_launch_template_version" {
  type        = string
  description = "Version of the launch template"
}

variable "asg_capacity_distribution_strategy" {
  type        = string
  description = "Strategy for distributing capacity across AZs"
}

variable "asg_capacity_reservation_preference" {
  type        = string
  description = "Capacity reservation preference"
}

variable "cloudformation_stacks" {
  type = map(object({
    name             = string
    capabilities     = list(string)
    disable_rollback = bool
    parameters       = map(string)
  }))
  description = "Map of CloudFormation stacks to manage"
  default     = {}
}

variable "config_rules" {
  type = map(object({
    name                        = string
    description                 = string
    input_parameters            = string
    maximum_execution_frequency = string
    scope = object({
      compliance_resource_types = list(string)
    })
    source_owner      = string
    source_identifier = string
    evaluation_mode   = string
  }))
  description = "Map of AWS Config rules to manage"
  default     = {}
}