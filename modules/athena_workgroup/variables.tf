variable "workgroups" {
  type = map(object({
    name                               = string
    description                        = optional(string)
    state                              = optional(string)
    force_destroy                      = optional(bool)
    bytes_scanned_cutoff_per_query     = optional(number)
    enforce_workgroup_configuration    = optional(bool)
    publish_cloudwatch_metrics_enabled = optional(bool)
    output_location                    = string
    encryption_option                  = string
    selected_engine_version            = optional(string)
    requester_pays_enabled             = optional(bool)
    tags                               = optional(map(string))
  }))
  description = "Athena workgroups to create with result configuration"
  default     = {}
}