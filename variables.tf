variable "region" {
  type        = string
  description = "AWS region to deploy resources into"
}

variable "athena_workgroup_name" {
  type        = string
  description = "Name of the Athena workgroup"
}

variable "athena_workgroup_state" {
  type        = string
  description = "State of the Athena workgroup (ENABLED or DISABLED)"
}

variable "athena_enforce_workgroup_configuration" {
  type        = bool
  description = "Whether workgroup settings override client-side settings"
}

variable "athena_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether CloudWatch metrics are enabled for the Athena workgroup"
}

variable "athena_requester_pays_enabled" {
  type        = bool
  description = "Whether requester pays is enabled for the Athena workgroup"
}

variable "athena_selected_engine_version" {
  type        = string
  description = "Requested Athena engine version"
}

variable "cloudformation_stack_name" {
  type        = string
  description = "Name of the CloudFormation stack"
}

variable "cloudformation_disable_rollback" {
  type        = bool
  description = "Whether to disable rollback on stack creation failure"
}

variable "vpc_id" {
  type        = string
  description = "The VPC ID used by internet gateway, network ACL, and route table"
}

variable "network_acl_default_network_acl_id" {
  type        = string
  description = "The ID of the default network ACL to manage"
}

variable "network_acl_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs to apply the Network ACL to"
}