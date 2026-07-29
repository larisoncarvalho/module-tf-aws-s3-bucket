# Infrastructure Documentation: global-settings

**Project:** global-settings  
**Date Generated:** 2026-07-27  
**IaC Tool:** Terraform/OpenTofu  
**Status:** Reconciled (0 add, 0 change, 0 destroy)

---

## 1. Overview

This Terraform/OpenTofu configuration manages AWS Glue Catalog tables in the `eu-central-1` region. The code was auto-generated from three discovered AWS Glue Catalog table resources and has been imported into state. Final reconciliation shows the infrastructure matches the configuration exactly: no changes are pending.

The stack manages temporary bronze-layer inventory tables that store cloud resource metadata (benchmarks, CSP info, resources, regions, account IDs, integrations, service details, and attributes) in Parquet format on S3.

---

## 2. Resources

| Terraform Address | Provider | Real-world Name/ID | Purpose |
|---|---|---|---|
| `module.glue_catalog_table["temp_bronze_inventory_380e218b"].aws_glue_catalog_table.this` | `aws` | `790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_380e218b` | Glue Catalog table for cloud inventory data (March 2026 snapshot, org=9r7ms9ixh41) |
| `module.glue_catalog_table["temp_bronze_inventory_381181d5"].aws_glue_catalog_table.this` | `aws` | `790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381181d5` | Glue Catalog table for cloud inventory data (July 2026 snapshot, org=test-marketplace) |
| `module.glue_catalog_table["temp_bronze_inventory_381361b2"].aws_glue_catalog_table.this` | `aws` | `790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381361b2` | Glue Catalog table for cloud inventory data (February 2026 snapshot, org=ferferferf) |

**Provider Configuration:**
- AWS provider region: `eu-central-1`
- AWS account ID: `790543352839`

---

## 3. Module Structure

### `modules/glue_catalog_table/`

A reusable module that wraps a single `aws_glue_catalog_table` resource.

**Files:**
- `main.tf` — Single `aws_glue_catalog_table.this` resource with dynamic `partition_keys` and `columns` blocks, and static `storage_descriptor` > `ser_de_info` and `skewed_info` blocks
- `variables.tf` — 18 input variables covering catalog ID, database name, table metadata (type, owner, retention), partition keys, parameters, storage descriptor properties (location, format, compression), columns, SerDe configuration, and skew settings
- `outputs.tf` — Single output: `id` (the Glue Catalog table ID)

**Called from root:** `main.tf` instantiates this module via `for_each = var.glue_catalog_tables` with three keys:
- `temp_bronze_inventory_380e218b`
- `temp_bronze_inventory_381181d5`
- `temp_bronze_inventory_381361b2`

Each instance receives values from the corresponding entry in `environments/sg.tfvars`.

---

## 4. How Import Works

The file `imports.sh` contains three `terraform import` (or `tofu import`) commands, one per Glue Catalog table:

```bash
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_380e218b"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_380e218b'
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_381181d5"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381181d5'
"$1" import -var-file environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_381361b2"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_381361b2'
```

**Import ID format:** `catalog_id:database_name:table_name`

### Running Imports

These commands were executed once during initial reconciliation. To re-import a single table (if state is lost):

```bash
terraform import -var-file environments/sg.tfvars \
  'module.glue_catalog_table["temp_bronze_inventory_380e218b"].aws_glue_catalog_table.this' \
  '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_380e218b'
```

Replace the table key and import ID as needed for the other two tables.

---

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

### Plan Changes

To preview changes using the default environment (`sg.tfvars`):

```bash
terraform plan -var-file=environments/sg.tfvars
```

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

### Target Another Environment

To manage a different environment (e.g., `prod`):

1. **Create a new tfvars file** from `sg.tfvars`:
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the file** with new values (table names, database names, S3 locations, etc.):
   ```bash
   vi environments/prod.tfvars
   ```

3. **Plan and apply** using the new file:
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

**No `.tf` code changes are required** — all configuration lives in tfvars files.

---

## 6. Variables

### Key Input Variables

All variables are defined in `variables.tf` and passed to module instances. Primary variable:

- **`glue_catalog_tables`** (map of objects, required)  
  - **Type:** `map(object({...}))`
  - **Description:** A map where each key is a table identifier and each value contains:
    - `catalog_id` (string, required) — AWS account ID (e.g., `790543352839`)
    - `database_name` (string, required) — Glue database name (e.g., `dev_pedro_chaves_data_lake`)
    - `name` (string, required) — Table name (e.g., `temp_bronze_inventory_380e218b`)
    - `table_type` (string, optional, default `""`) — `EXTERNAL_TABLE`, `ICEBERG_TABLE`, etc.
    - `owner` (string, optional, default `null`) — Table owner (e.g., `hadoop`)
    - `retention` (number, optional, default `0`) — Retention days
    - `partition_keys` (list of objects, optional) — Partition column definitions
    - `parameters` (map(string), optional) — Custom parameters (e.g., `EXTERNAL = "TRUE"`)
    - `storage_location` (string, required) — S3 path (e.g., `s3://bucket/path/`)
    - `input_format` (string, optional) — Hive input format
    - `output_format` (string, optional) — Hive output format
    - `compressed` (boolean, optional, default `false`)
    - `number_of_buckets` (number, optional, default `-1`)
    - `stored_as_sub_directories` (boolean, optional, default `false`)
    - `columns` (list of objects, optional) — Column definitions
    - `serde_name` (string, optional, default `null`) — SerDe name
    - `serde_serialization_library` (string, optional) — SerDe library class
    - `serde_parameters` (map(string), optional) — SerDe parameters
    - `bucket_columns` (list(string), optional) — Bucket columns
    - `sort_columns` (list, optional) — Sort columns (omitted in `main.tf` — see caveats)
    - `skewed_column_names`, `skewed_column_value_location_maps`, `skewed_column_values` (optional) — Skew info

### Sensitive Variables

**No sensitive variables require secrets.** All values in `environments/sg.tfvars` are non-sensitive IDs, names, and paths. No `secrets.auto.tfvars` is needed.

---

## 7. Infrastructure Graph

```
module.glue_catalog_table["temp_bronze_inventory_380e218b"]
└── aws_glue_catalog_table.this
    ├── catalog_id: 790543352839
    ├── database_name: dev_pedro_chaves_data_lake
    ├── storage_location: s3://dev-pedro-chaves-infra-lake-bronze/.../org=9r7ms9ixh41/...
    └── 12 string columns: benchmark, csp, resource, region, accountid, integrations, 
                           name, resource_type, resource_id, service, tags, attributes

module.glue_catalog_table["temp_bronze_inventory_381181d5"]
└── aws_glue_catalog_table.this
    ├── catalog_id: 790543352839
    ├── database_name: dev_pedro_chaves_data_lake
    ├── storage_location: s3://dev-pedro-chaves-infra-lake-bronze/.../org=test-marketplace/...
    └── 12 string columns: benchmark, csp, resource, region, accountid, integrations, 
                           name, resource_type, resource_id, service, tags, attributes

module.glue_catalog_table["temp_bronze_inventory_381361b2"]
└── aws_glue_catalog_table.this
    ├── catalog_id: 790543352839
    ├── database_name: dev_pedro_chaves_data_lake
    ├── storage_location: s3://dev-pedro-chaves-infra-lake-bronze/.../org=ferferferf/...
    └── 12 string columns: benchmark, csp, resource, region, accountid, integrations, 
                           name, resource_type, resource_id, service, tags, attributes
```

**Note:** All three tables are independent; there are no cross-table references or dependencies.

---

## 8. Notable Decisions & Caveats

### `sort_columns` Argument Omitted

The `sort_columns` variable is **defined in the root module's variable type** but **not used in module instantiation** or **not emitted as a dynamic block in `modules/glue_catalog_table/main.tf`**. 

**Reason:** All three discovered Glue Catalog tables have empty `sort_columns` arrays. The AWS provider's `storage_descriptor` block supports an optional `sort_columns` block (not a simple list argument), and since no actual sort columns exist, the configuration was simplified by omitting the dynamic block. If sort columns are needed in the future, add the dynamic block to `modules/glue_catalog_table/main.tf`:

```hcl
dynamic "sort_columns" {
  for_each = var.sort_columns
  content {
    column = sort_columns.value.column
    sort_order = sort_columns.value.sort_order
  }
}
```

### `serde_name` Set to `null`

The `serde_name` variable is included and defaults to `null` because AWS Glue discovery showed no SerDe name (`"Name": null` in the API response). The `ser_de_info` block in the resource accepts this null value without issues.

### `skewed_info` Block Always Emitted

The `skewed_info` block is **always emitted** even when all lists/maps are empty, matching AWS defaults:
- `skewed_column_names = []`
- `skewed_column_value_location_maps = {}`
- `skewed_column_values = []`

This is by design: the block structure is required in the provider, and empty collections are valid.

### Parquet Serialization

All three tables use **Parquet format** with `org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe` as the SerDe library. Serialization format parameter is fixed to `"1"`.

### External Tables in Bronze Layer

All tables are of type `EXTERNAL_TABLE` (not managed by Glue) and reside in an S3 "bronze" layer at:
- `s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=<ORG>/year=<YYYY>/month=<MM>/day=<DD>/`

These are temporary snapshot tables created by a Lambda processor (`dev-pedro-chaves-bronze-processor-lambda`). They should not be modified manually; instead, new snapshots will be added with different `day/month/year` values or `org` identifiers.

### No Partition Keys

All three tables have **empty partition key lists** despite being date-partitioned on S3 (via directory structure). Hive partitioning is **implicit** in the S3 path, not registered as table partitions.

### Catalog ID is AWS Account ID

The `catalog_id` variable equals the AWS account ID (`790543352839`) because all tables are in the default Glue Catalog (not a cross-account Lake Formation resource catalog).

### Plan is Clean

Final reconciliation: `0 add, 0 change, 0 destroy`. The configuration and live Glue Catalog tables match exactly. No drift detected.

---

## 9. Additional Notes

- **Region:** All resources are in `eu-central-1` (hardcoded in `providers.tf`). To manage tables in another region, update the provider block.
- **Database Dependency:** All three tables reference the database `dev_pedro_chaves_data_lake`. This database is **assumed to exist** and is not managed by this code. Ensure the database is created (or already exists) in Glue before applying the table resources.
- **S3 Bucket:** The S3 bucket `dev-pedro-chaves-infra-lake-bronze` is **assumed to exist** and is not managed by this code.
- **State Backend:** Terraform state is managed locally or via a configured remote backend (e.g., S3, Terraform Cloud). Ensure state files are backed up and version controlled appropriately.

