variable "region" {
  description = "AWS region"
  type        = string
}

variable "cloudformation_stack_name" {
  description = "Name of the CloudFormation stack"
  type        = string
}

variable "cloudformation_stack_disable_rollback" {
  description = "Set to true to disable rollback of the stack if stack creation failed"
  type        = bool
}

variable "athena_workgroup_name" {
  description = "Name of the Athena workgroup"
  type        = string
}

variable "athena_workgroup_state" {
  description = "State of the workgroup. Valid values are DISABLED or ENABLED"
  type        = string
}

variable "athena_workgroup_enforce_workgroup_configuration" {
  description = "Boolean whether the settings for the workgroup override client-side settings"
  type        = bool
}

variable "athena_workgroup_publish_cloudwatch_metrics_enabled" {
  description = "Boolean whether Amazon CloudWatch metrics are enabled for the workgroup"
  type        = bool
}

variable "athena_workgroup_requester_pays_enabled" {
  description = "If set to true, allows members to reference Amazon S3 Requester Pays buckets in queries"
  type        = bool
}

variable "athena_workgroup_selected_engine_version" {
  description = "Requested engine version"
  type        = string
}

variable "internet_gateway_vpc_id" {
  description = "The VPC ID to attach the Internet Gateway to"
  type        = string
}