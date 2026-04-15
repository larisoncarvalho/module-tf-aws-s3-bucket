variable "region" {
  type        = string
  description = "AWS region for the infrastructure"
}

variable "certificates" {
  type = map(object({
    domain_name               = string
    subject_alternative_names = list(string)
    validation_method         = string
    tags                      = map(string)
  }))
  description = "ACM certificates to create with domain validation configuration"
}

variable "rest_apis" {
  type = map(object({
    name                     = string
    description              = optional(string)
    api_key_source           = optional(string)
    binary_media_types       = optional(list(string))
    minimum_compression_size = optional(number)
    tags                     = optional(map(string))
  }))
  description = "API Gateway REST APIs to create"
}

variable "athena_workgroups" {
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
}