variable "glue_catalog_tables" {
  description = "Map of Glue Catalog Table configurations"
  type = map(object({
    catalog_id    = optional(string, null)
    database_name = string
    name          = string
    owner         = optional(string, null)
    table_type    = optional(string, null)
    parameters    = optional(map(string), {})

    storage_descriptor = optional(object({
      location                  = optional(string, null)
      input_format              = optional(string, null)
      output_format             = optional(string, null)
      compressed                = optional(bool, false)
      number_of_buckets         = optional(number, -1)
      stored_as_sub_directories = optional(bool, false)

      columns = optional(list(object({
        name = string
        type = optional(string, null)
      })), [])

      ser_de_info = optional(object({
        name                  = optional(string, null)
        serialization_library = optional(string, null)
        parameters            = optional(map(string), {})
      }), null)

      skewed_info = optional(object({
        skewed_column_names               = optional(list(string), [])
        skewed_column_value_location_maps = optional(map(string), {})
        skewed_column_values              = optional(list(string), [])
      }), null)

      sort_columns = optional(list(object({
        column     = string
        sort_order = number
      })), [])
      bucket_columns = optional(list(string), [])
    }), null)
  }))
  default = {}
}
