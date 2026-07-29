glue_catalog_tables = {
  "temp_bronze_inventory_380e218b" = {
    catalog_id     = "790543352839"
    database_name  = "dev_pedro_chaves_data_lake"
    name           = "temp_bronze_inventory_380e218b"
    table_type     = "EXTERNAL_TABLE"
    owner          = "hadoop"
    retention      = 0
    partition_keys = []
    parameters = {
      EXTERNAL              = "TRUE"
      transient_lastDdlTime = "1774897064"
    }

    storage_location          = "s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=9r7ms9ixh41/year=2026/month=03/day=30"
    input_format              = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format             = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    compressed                = false
    number_of_buckets         = -1
    stored_as_sub_directories = false
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
      { name = "attributes", type = "string" }
    ]

    serde_name                        = null
    serde_serialization_library       = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    serde_parameters                  = { "serialization.format" = "1" }
    bucket_columns                    = []
    sort_columns                      = []
    skewed_column_names               = []
    skewed_column_value_location_maps = {}
    skewed_column_values              = []
  }

  "temp_bronze_inventory_381181d5" = {
    catalog_id     = "790543352839"
    database_name  = "dev_pedro_chaves_data_lake"
    name           = "temp_bronze_inventory_381181d5"
    table_type     = "EXTERNAL_TABLE"
    owner          = "hadoop"
    retention      = 0
    partition_keys = []
    parameters = {
      EXTERNAL              = "TRUE"
      transient_lastDdlTime = "1784141999"
    }

    storage_location          = "s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=test-marketplace/year=2026/month=07/day=15"
    input_format              = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format             = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    compressed                = false
    number_of_buckets         = -1
    stored_as_sub_directories = false
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
      { name = "attributes", type = "string" }
    ]

    serde_name                        = null
    serde_serialization_library       = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    serde_parameters                  = { "serialization.format" = "1" }
    bucket_columns                    = []
    sort_columns                      = []
    skewed_column_names               = []
    skewed_column_value_location_maps = {}
    skewed_column_values              = []
  }

  "temp_bronze_inventory_381361b2" = {
    catalog_id     = "790543352839"
    database_name  = "dev_pedro_chaves_data_lake"
    name           = "temp_bronze_inventory_381361b2"
    table_type     = "EXTERNAL_TABLE"
    owner          = "hadoop"
    retention      = 0
    partition_keys = []
    parameters = {
      EXTERNAL              = "TRUE"
      transient_lastDdlTime = "1772012787"
    }

    storage_location          = "s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=ferferferf/year=2026/month=02/day=25"
    input_format              = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
    output_format             = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
    compressed                = false
    number_of_buckets         = -1
    stored_as_sub_directories = false
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
      { name = "attributes", type = "string" }
    ]

    serde_name                        = null
    serde_serialization_library       = "org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe"
    serde_parameters                  = { "serialization.format" = "1" }
    bucket_columns                    = []
    sort_columns                      = []
    skewed_column_names               = []
    skewed_column_value_location_maps = {}
    skewed_column_values              = []
  }
}
