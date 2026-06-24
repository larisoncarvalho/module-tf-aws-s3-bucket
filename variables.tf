variable "cloudformation_stacks" {
  description = "Map of CloudFormation stacks to manage"
  type = map(object({
    name              = string
    disable_rollback  = optional(bool, false)
    notification_arns = optional(list(string), [])
    tags              = optional(map(string), {})
  }))
  default = {}
}

variable "athena_workgroups" {
  description = "Map of Athena workgroups to manage"
  type = map(object({
    name                               = string
    description                        = optional(string, "")
    state                              = optional(string, "ENABLED")
    enforce_workgroup_configuration    = optional(bool, true)
    publish_cloudwatch_metrics_enabled = optional(bool, true)
    requester_pays_enabled             = optional(bool, false)
    selected_engine_version            = optional(string, "AUTO")
    tags                               = optional(map(string), {})
  }))
  default = {}
}
