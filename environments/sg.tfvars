glue_catalog_tables = {
  temp_bronze_inventory_35dcc724 = {
    catalog_id    = "790543352839"
    database_name = "dev_pedro_chaves_data_lake"
    name          = "temp_bronze_inventory_35dcc724"
    owner         = "hadoop"
    table_type    = "EXTERNAL_TABLE"
    parameters = {
      EXTERNAL              = "TRUE"
      transient_lastDdlTime = "1773989865"
    }
    storage_descriptor = {
      location                  = "s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=ethical-bronze/year=2026/month=03/day=20"
      input_format              = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
      output_format             = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
      compressed                = false
      number_of_buckets         = -1
      stored_as_sub_directories = false
      bucket_columns            = []

      columns = [
        { name = "benchmark", type = "string" },
        { name = "csp", type = "string" },
        { name = "resource", type = "string" },
        { name = "region", type = "string" },
        { name = "accountid", type = "string" },
        { name = "integrations", type = "string" },
        { name = "name", type = "string" },
        { name = "resource_type", type = "string" },
        { name = "resource_id", type = "string" },
        { name = "service", type = "string" },
        { name = "tags", type = "string" },
        { name = "attributes", type = "string" },
      ]

      ser_de_info = {
        name                  = null
        serialization_library = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
        parameters = {
          "serialization.format" = "1"
        }
      }

      skewed_info = {
        skewed_column_names               = []
        skewed_column_value_location_maps = {}
        skewed_column_values              = []
      }

      sort_columns = []
    }
  }
}
