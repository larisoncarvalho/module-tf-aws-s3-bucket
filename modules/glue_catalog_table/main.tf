resource "aws_glue_catalog_table" "this" {
  catalog_id    = var.catalog_id
  database_name = var.database_name
  name          = var.name
  table_type    = var.table_type
  owner         = var.owner
  retention     = var.retention

  dynamic "partition_keys" {
    for_each = var.partition_keys
    content {
      name    = partition_keys.value.name
      type    = partition_keys.value.type
      comment = lookup(partition_keys.value, "comment", null)
    }
  }

  parameters = var.parameters

  storage_descriptor {
    location                  = var.storage_location
    input_format              = var.input_format
    output_format             = var.output_format
    compressed                = var.compressed
    number_of_buckets         = var.number_of_buckets
    stored_as_sub_directories = var.stored_as_sub_directories

    dynamic "columns" {
      for_each = var.columns
      content {
        name    = columns.value.name
        type    = columns.value.type
        comment = lookup(columns.value, "comment", null)
      }
    }

    ser_de_info {
      name                  = var.serde_name
      serialization_library = var.serde_serialization_library
      parameters            = var.serde_parameters
    }

    bucket_columns = var.bucket_columns

    skewed_info {
      skewed_column_names               = var.skewed_column_names
      skewed_column_value_location_maps = var.skewed_column_value_location_maps
      skewed_column_values              = var.skewed_column_values
    }
  }
}
