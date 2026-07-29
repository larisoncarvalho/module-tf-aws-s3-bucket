variable "catalog_id" {
  type = string
}

variable "database_name" {
  type = string
}

variable "name" {
  type = string
}

variable "table_type" {
  type    = string
  default = ""
}

variable "owner" {
  type    = string
  default = null
}

variable "retention" {
  type    = number
  default = 0
}

variable "partition_keys" {
  type = list(object({
    name    = string
    type    = optional(string, "")
    comment = optional(string, null)
  }))
  default = []
}

variable "parameters" {
  type    = map(string)
  default = {}
}

variable "storage_location" {
  type = string
}

variable "input_format" {
  type    = string
  default = null
}

variable "output_format" {
  type    = string
  default = null
}

variable "compressed" {
  type    = bool
  default = false
}

variable "number_of_buckets" {
  type    = number
  default = -1
}

variable "stored_as_sub_directories" {
  type    = bool
  default = false
}

variable "columns" {
  type = list(object({
    name    = string
    type    = optional(string, "")
    comment = optional(string, null)
  }))
  default = []
}

variable "serde_name" {
  type    = string
  default = null
}

variable "serde_serialization_library" {
  type    = string
  default = null
}

variable "serde_parameters" {
  type    = map(string)
  default = {}
}

variable "bucket_columns" {
  type    = list(string)
  default = []
}

variable "sort_columns" {
  type    = list(any)
  default = []
}

variable "skewed_column_names" {
  type    = list(string)
  default = []
}

variable "skewed_column_value_location_maps" {
  type    = map(string)
  default = {}
}

variable "skewed_column_values" {
  type    = list(string)
  default = []
}
