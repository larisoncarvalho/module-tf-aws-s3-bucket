variable "config_rules" {
  type = map(object({
    name                        = string
    description                 = string
    input_parameters            = string
    maximum_execution_frequency = string
    scope = object({
      compliance_resource_types = list(string)
    })
    source_owner        = string
    source_identifier   = string
    evaluation_mode     = string
  }))
  description = "Map of AWS Config rules to manage"
  default     = {}
}