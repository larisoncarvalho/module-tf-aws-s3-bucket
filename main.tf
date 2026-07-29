module "glue_catalog_table" {
  source   = "./modules/glue_catalog_table"
  for_each = var.glue_catalog_tables

  catalog_id    = each.value.catalog_id
  database_name = each.value.database_name
  name          = each.value.name
  table_type    = each.value.table_type
  owner         = each.value.owner
  retention     = each.value.retention

  partition_keys = each.value.partition_keys
  parameters     = each.value.parameters

  storage_location          = each.value.storage_location
  input_format              = each.value.input_format
  output_format             = each.value.output_format
  compressed                = each.value.compressed
  number_of_buckets         = each.value.number_of_buckets
  stored_as_sub_directories = each.value.stored_as_sub_directories
  columns                   = each.value.columns

  serde_name                        = each.value.serde_name
  serde_serialization_library       = each.value.serde_serialization_library
  serde_parameters                  = each.value.serde_parameters
  bucket_columns                    = each.value.bucket_columns
  sort_columns                      = each.value.sort_columns
  skewed_column_names               = each.value.skewed_column_names
  skewed_column_value_location_maps = each.value.skewed_column_value_location_maps
  skewed_column_values              = each.value.skewed_column_values
}
