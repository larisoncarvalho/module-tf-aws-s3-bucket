variable "workgroups" {
  description = "Athena workgroups to create"
  type = map(object({
    name                               = string
    description                        = optional(string)
    state                              = string
    bytes_scanned_cutoff_per_query     = optional(number)
    enforce_workgroup_configuration    = bool
    publish_cloudwatch_metrics_enabled = bool
    requester_pays_enabled             = bool
    output_location                    = string
    encryption_option                  = string
    selected_engine_version            = string
    tags                               = optional(map(string))
  }))
  default = {}
}