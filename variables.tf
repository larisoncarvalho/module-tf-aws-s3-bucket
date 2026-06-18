variable "region" {
  type        = string
  description = "AWS region for the provider"
}

variable "athena_workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "athena_workgroup_state" {
  type        = string
  description = "State of the Athena workgroup. Valid values are DISABLED or ENABLED"
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  type        = bool
  description = "Whether the settings for the workgroup override client-side settings"
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether Amazon CloudWatch metrics are enabled for the workgroup"
}

variable "athena_workgroup_requester_pays_enabled" {
  type        = bool
  description = "Whether members can reference Amazon S3 Requester Pays buckets in queries"
}

variable "athena_workgroup_selected_engine_version" {
  type        = string
  description = "Requested Athena engine version"
}

variable "cloudformation_stack_name" {
  type        = string
  description = "Name of the CloudFormation stack"
}

variable "cloudformation_stack_disable_rollback" {
  type        = bool
  description = "Whether to disable rollback of the stack if stack creation failed"
}

variable "internet_gateway_vpc_id" {
  type        = string
  description = "The VPC ID to attach the Internet Gateway to"
}