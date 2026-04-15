variable "region" {
  description = "AWS region"
  type        = string
}

variable "certificates" {
  description = "ACM certificates to create"
  type = map(object({
    domain_name                              = string
    subject_alternative_names                = list(string)
    validation_method                        = string
    key_algorithm                            = string
    certificate_transparency_logging_preference = string
    tags                                     = map(string)
  }))
}

variable "rest_apis" {
  description = "API Gateway REST APIs to create"
  type = map(object({
    name                     = string
    description              = optional(string)
    api_key_source           = string
    binary_media_types       = optional(list(string))
    minimum_compression_size = optional(number)
    tags                     = optional(map(string))
  }))
}

variable "athena_workgroups" {
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
}