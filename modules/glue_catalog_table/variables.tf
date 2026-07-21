variable "catalog_id" {
  description = "Glue catalog ID (AWS account ID)"
  type        = string
  default     = null
}

variable "database_name" {
  description = "Name of the Glue catalog database"
  type        = string
}

variable "name" {
  description = "Name of the Glue catalog table"
  type        = string
}

variable "owner" {
  description = "Owner of the table"
  type        = string
  default     = null
}

variable "table_type" {
  description = "Type of the table (e.g. EXTERNAL_TABLE)"
  type        = string
  default     = null
}

variable "parameters" {
  description = "Table-level parameters"
  type        = map(string)
  default     = {}
}

variable "storage_descriptor" {
  description = "Storage descriptor for the table"
  type = object({
    location                  = optional(string, null)
    input_format              = optional(string, null)
    output_format             = optional(string, null)
    compressed                = optional(bool, false)
    number_of_buckets         = optional(number, -1)
    stored_as_sub_directories = optional(bool, false)
    bucket_columns            = optional(list(string), [])

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
  })
  default = null
}
