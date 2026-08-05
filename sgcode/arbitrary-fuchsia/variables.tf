variable "region" {
  description = "AWS region"
  type        = string
}

variable "certificates" {
  description = "ACM certificates to create"
  type = map(object({
    domain_name               = string
    subject_alternative_names = list(string)
    validation_method         = string
    key_algorithm             = string
    tags                      = map(string)
  }))
}

variable "rest_apis" {
  description = "API Gateway REST APIs to create"
  type = map(object({
    name                     = string
    description              = string
    api_key_source           = string
    binary_media_types       = list(string)
    minimum_compression_size = number
    tags                     = map(string)
  }))
}

variable "athena_workgroups" {
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