variable "workgroups" {
  description = "Athena workgroups to create"
  type = map(object({
    name                               = string
    description                        = string
    state                              = string
    force_destroy                      = bool
    bytes_scanned_cutoff_per_query     = number
    enforce_workgroup_configuration    = bool
    publish_cloudwatch_metrics_enabled = bool
    output_location                    = string
    encryption_option                  = string
    selected_engine_version            = string
    requester_pays_enabled             = bool
    tags                               = map(string)
  }))
}