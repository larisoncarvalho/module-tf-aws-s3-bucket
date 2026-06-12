variable "region" {
  type        = string
  description = "AWS region"
}

variable "primary_workgroup_name" {
  type        = string
  description = "Name of the primary Athena workgroup"
}

variable "primary_workgroup_state" {
  type        = string
  description = "State of the primary Athena workgroup"
}

variable "primary_workgroup_enforce_workgroup_configuration" {
  type        = bool
  description = "Whether the settings for the primary workgroup override client-side settings"
}

variable "primary_workgroup_publish_cloudwatch_metrics_enabled" {
  type        = bool
  description = "Whether Amazon CloudWatch metrics are enabled for the primary workgroup"
}

variable "primary_workgroup_requester_pays_enabled" {
  type        = bool
  description = "Whether members can reference Amazon S3 Requester Pays buckets in queries for the primary workgroup"
}

variable "primary_workgroup_selected_engine_version" {
  type        = string
  description = "Requested engine version for the primary workgroup"
}

variable "stulyze_app_stack_name" {
  type        = string
  description = "Name of the stulyze-app CloudFormation stack"
}

variable "stulyze_app_stack_disable_rollback" {
  type        = bool
  description = "Set to true to disable rollback of the stulyze-app stack if stack creation failed"
}

variable "stulyze_app_stack_template_body" {
  type        = string
  description = "Template body for the stulyze-app CloudFormation stack"
}

variable "igw_02aec4b4978ee2879_vpc_id" {
  type        = string
  description = "VPC ID for Internet Gateway igw-02aec4b4978ee2879"
}