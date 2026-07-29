variable "glue_catalog_tables" {
  type = map(object({
    catalog_id    = string
    database_name = string
    name          = string
    table_type    = optional(string, "")
    owner         = optional(string, null)
    retention     = optional(number, 0)
    partition_keys = optional(list(object({
      name    = string
      type    = optional(string, "")
      comment = optional(string, null)
    })), [])
    parameters = optional(map(string), {})

    storage_location          = string
    input_format              = optional(string, null)
    output_format             = optional(string, null)
    compressed                = optional(bool, false)
    number_of_buckets         = optional(number, -1)
    stored_as_sub_directories = optional(bool, false)
    columns = optional(list(object({
      name    = string
      type    = optional(string, "")
      comment = optional(string, null)
    })), [])

    serde_name                        = optional(string, null)
    serde_serialization_library       = optional(string, null)
    serde_parameters                  = optional(map(string), {})
    bucket_columns                    = optional(list(string), [])
    sort_columns                      = optional(list(any), [])
    skewed_column_names               = optional(list(string), [])
    skewed_column_value_location_maps = optional(map(string), {})
    skewed_column_values              = optional(list(string), [])
  }))
  default = {}
}
