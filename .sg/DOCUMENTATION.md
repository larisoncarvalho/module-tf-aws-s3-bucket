# Documentation: global-settings (Glue Catalog Table)

## 1. Overview

This Terraform/OpenTofu codebase manages a single **AWS Glue Catalog Table** that was discovered in the eu-central-1 region as part of an infrastructure audit. The code was generated from the cloud resource discovery, imported into Terraform state using `terraform import`, and reconciled until `terraform plan` showed **0 additions, 0 changes, 0 deletions** — meaning the configuration now precisely matches the live cloud infrastructure.

**Scope:**
- One AWS Glue Catalog Table (`temp_bronze_inventory_35dcc724`) in database `dev_pedro_chaves_data_lake`
- Stored in AWS account `790543352839` (eu-central-1 region)
- External Parquet table pointing to S3 location in an Ethical Bronze data lake
- Managed via a reusable Terraform module called `glue_catalog_table` using `for_each` iteration

**What was done:**
1. Discovery identified the live Glue table resource
2. A module-based Terraform configuration was generated to represent it
3. The resource was imported into state using the `imports.sh` script
4. Configuration was iteratively adjusted until plan output showed no drift
5. Final state is clean and production-ready

---

## 2. Resources

All managed resources are listed below. The "Terraform address" column shows how to reference each resource in code or commands (e.g., for `terraform apply -target`).

| Terraform Address | Provider | Resource Type | Cloud ID / Name | Real-World ID | Purpose |
|---|---|---|---|---|---|
| `module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this` | `hashicorp/aws` | `aws_glue_catalog_table` | `temp_bronze_inventory_35dcc724` | `arn:aws:glue:eu-central-1:790543352839:table/dev_pedro_chaves_data_lake/temp_bronze_inventory_35dcc724` | Glue Catalog table in dev_pedro_chaves_data_lake database, backed by Parquet files in S3 bronze layer, containing 12 inventory columns (benchmark, csp, resource, region, accountid, integrations, name, resource_type, resource_id, service, tags, attributes) |

**Table summary:**
- **Columns:** 12 (all string type)
- **Storage format:** Parquet
- **Table type:** EXTERNAL_TABLE
- **Owner:** hadoop
- **Catalog ID:** 790543352839 (AWS account ID)
- **Database:** dev_pedro_chaves_data_lake
- **Location:** `s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=ethical-bronze/year=2026/month=03/day=20`
- **SerDe:** ParquetHiveSerDe with serialization format = "1"

---

## 3. Module Structure

### Root Module

**Files:**
- `main.tf` — Entry point; instantiates the `glue_catalog_table` module using `for_each` over `var.glue_catalog_tables`
- `variables.tf` — Declares the root input variable `glue_catalog_tables` (map of Glue table configurations)
- `outputs.tf` — No singleton outputs (all outputs come from module instances)
- `providers.tf` — AWS provider configured for `eu-central-1`
- `versions.tf` — Terraform version requirements (any version; requires `hashicorp/aws` provider)

**Key design:**
- Uses `for_each` iteration to support multiple Glue tables via a single root variable map
- Currently one entry: `temp_bronze_inventory_35dcc724`
- Variables are passed from root to the module unchanged (no transformation)

---

### Module: `modules/glue_catalog_table/`

**Purpose:** Reusable Terraform module that wraps a single `aws_glue_catalog_table` resource.

**Files:**
- `main.tf` — Defines `aws_glue_catalog_table.this` with all attributes and dynamic blocks
- `variables.tf` — Module-level input parameters matching Glue table API
- `outputs.tf` — Exports `id` and `arn` of the created table

**Key attributes:**
- `catalog_id` — AWS account ID (explicit; optional, defaults to null)
- `database_name` — Target database name (required)
- `name` — Table name (required)
- `owner` — Table owner string (optional)
- `table_type` — e.g., "EXTERNAL_TABLE" (optional)
- `parameters` — Map of key-value table-level parameters (optional)
- `storage_descriptor` — Optional object containing:
  - Location, input/output formats, compression flags
  - Columns (list of name/type pairs)
  - SerDe info (serialization library and parameters)
  - Skewed info (skew column metadata)
  - Sort columns and bucket columns (lists)

**Dynamic blocks:**
All nested objects within `storage_descriptor` use Terraform `dynamic` blocks to handle optional sub-structures gracefully. This allows the module to work with partial or complete storage descriptor configurations without errors.

**External modules:** None — this is a leaf module with no further module nesting.

---

## 4. How Import Works

### Initial Import

The `imports.sh` script contains a single `terraform import` command that was executed once during initial reconciliation to bring the live Glue table into Terraform state:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this' \
  '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_35dcc724'
```

**What this does:**
1. Reads the variable definitions from `environments/sg.tfvars`
2. Instantiates the module with key `temp_bronze_inventory_35dcc724`
3. Imports the cloud resource identified by the AWS import ID `790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_35dcc724` (format: `catalog_id:database_name:table_name`)
4. Stores the resource's state in `terraform.tfstate` under the given address

**Import ID format:**
AWS Glue Catalog Table import IDs are colon-separated triplets:
- `catalog_id` — AWS account ID (790543352839)
- `database_name` — Database name (dev_pedro_chaves_data_lake)
- `table_name` — Table name (temp_bronze_inventory_35dcc724)

### Re-importing After State Loss

If the local state file is lost or corrupted, re-import the resource with:

```bash
terraform init
terraform import -var-file environments/sg.tfvars \
  'module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this' \
  '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_35dcc724'
```

After import, run `terraform plan` to verify all current configuration matches the cloud resource.

---

## 5. How to Use the Code

### Prerequisites
- Terraform/OpenTofu binary installed (use the path configured in your environment)
- AWS credentials configured (via environment variables, ~/.aws/config, or IAM role)
- Access to AWS account 790543352839 with permissions to describe and modify Glue resources

### Working Directory

All commands assume you are in `/mnt/sg_workspace/user/global-settings`.

### Initialize Terraform

```bash
terraform init
```

This downloads the AWS provider and initializes the local `.terraform/` directory. Safe to run multiple times.

### View the Plan (No Changes)

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output:
```
No changes. Infrastructure matches configuration.
```

If you see additions, changes, or deletions, verify that:
1. AWS credentials are correct
2. The table still exists in the cloud at the expected ARN
3. No manual edits were made to the live table
4. The state file is up-to-date (no concurrent Terraform runs in other environments)

### Apply (Make Changes)

```bash
terraform apply -var-file=environments/sg.tfvars
```

This will prompt for confirmation before modifying any resources. Since the code is reconciled, this typically shows no changes.

### Targeted Operations

To affect only one resource:
```bash
terraform plan -target='module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this' -var-file=environments/sg.tfvars
```

### Using a Different Environment

To manage a different environment (e.g., prod or staging), create a new variables file:

```bash
# Copy the template
cp environments/sg.tfvars environments/prod.tfvars

# Edit with prod-specific values
# (e.g., change database_name, catalog_id, table name, S3 location, etc.)
vim environments/prod.tfvars

# Plan against prod
terraform plan -var-file=environments/prod.tfvars

# Apply changes (after review)
terraform apply -var-file=environments/prod.tfvars
```

**Important:** Do NOT edit the `.tf` files themselves when switching environments. All configuration comes from the `.tfvars` files.

### Destroying Resources

To destroy the managed Glue table:

```bash
terraform destroy -var-file=environments/sg.tfvars
```

This will prompt for confirmation before deleting the live resource.

---

## 6. Variables

### Root Variables

#### `glue_catalog_tables` (map of objects)

**Type:** `map(object({...}))`

**Default:** `{}`

**Description:** A map where each key is a table identifier and each value describes a Glue Catalog Table configuration.

**Object schema:**

| Field | Type | Default | Required? | Description |
|---|---|---|---|---|
| `catalog_id` | `string` | `null` | No | AWS account ID (Glue catalog ID). If omitted, uses the AWS provider's default account. |
| `database_name` | `string` | — | **Yes** | Name of the Glue database containing the table. |
| `name` | `string` | — | **Yes** | Name of the Glue table. |
| `owner` | `string` | `null` | No | Owner of the table (e.g., "hadoop"). |
| `table_type` | `string` | `null` | No | Type of table (e.g., "EXTERNAL_TABLE", "VIRTUAL_VIEW"). |
| `parameters` | `map(string)` | `{}` | No | Key-value parameters stored at table level (e.g., EXTERNAL="TRUE"). |
| `storage_descriptor` | object | `null` | No | Physical storage metadata (location, format, columns, SerDe, etc.). See below. |

**Storage Descriptor Object Schema:**

| Field | Type | Default | Description |
|---|---|---|---|
| `location` | `string` | `null` | S3 path or other storage location. |
| `input_format` | `string` | `null` | Input format class (e.g., Parquet input format). |
| `output_format` | `string` | `null` | Output format class (e.g., Parquet output format). |
| `compressed` | `bool` | `false` | Whether data is compressed. |
| `number_of_buckets` | `number` | `-1` | Number of buckets (for bucketing); -1 = unbucketed. |
| `stored_as_sub_directories` | `bool` | `false` | Whether data is stored in subdirectories. |
| `bucket_columns` | `list(string)` | `[]` | Columns used for bucketing. |
| `columns` | `list(object({name: string, type: string}))` | `[]` | Table columns (name and optional type). |
| `ser_de_info` | object | `null` | Serialization/deserialization library and parameters. |
| `skewed_info` | object | `null` | Skew column metadata (advanced; rarely used). |
| `sort_columns` | `list(object({column: string, sort_order: number}))` | `[]` | Columns and sort order. |

**Current value (from `environments/sg.tfvars`):**

```hcl
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
      location      = "s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=ethical-bronze/year=2026/month=03/day=20"
      input_format  = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat"
      output_format = "org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat"
      compressed    = false
      number_of_buckets = -1
      stored_as_sub_directories = false
      bucket_columns = []
      columns = [
        { name = "benchmark",     type = "string" },
        { name = "csp",           type = "string" },
        { name = "resource",      type = "string" },
        { name = "region",        type = "string" },
        { name = "accountid",     type = "string" },
        { name = "integrations",  type = "string" },
        { name = "name",          type = "string" },
        { name = "resource_type", type = "string" },
        { name = "resource_id",   type = "string" },
        { name = "service",       type = "string" },
        { name = "tags",          type = "string" },
        { name = "attributes",    type = "string" },
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
```

### Sensitive Variables

**None.** This configuration contains no sensitive information (passwords, API keys, secrets). All values are safe to store in version control.

---

## 7. Infrastructure Graph

```
module.glue_catalog_table["temp_bronze_inventory_35dcc724"]
└── aws_glue_catalog_table.this
    ├── [catalog_id: 790543352839]
    ├── [database_name: dev_pedro_chaves_data_lake]
    ├── [name: temp_bronze_inventory_35dcc724]
    ├── [owner: hadoop]
    ├── [table_type: EXTERNAL_TABLE]
    └── storage_descriptor
        ├── location: s3://dev-pedro-chaves-infra-lake-bronze/source=cloud-inventory/org=ethical-bronze/year=2026/month=03/day=20
        ├── input_format: org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat
        ├── output_format: org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat
        ├── columns (12 total)
        │   ├── benchmark (string)
        │   ├── csp (string)
        │   ├── resource (string)
        │   ├── region (string)
        │   ├── accountid (string)
        │   ├── integrations (string)
        │   ├── name (string)
        │   ├── resource_type (string)
        │   ├── resource_id (string)
        │   ├── service (string)
        │   ├── tags (string)
        │   └── attributes (string)
        ├── ser_de_info
        │   └── serialization_library: org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe
        └── skewed_info (empty)

[Dependencies to Glue Database]
dev_pedro_chaves_data_lake (referenced by database_name)
└── Not managed by this module (external reference)
```

**Data flow:**
1. The Glue table is external (hosted in S3 at the specified location)
2. It references a database `dev_pedro_chaves_data_lake` which must exist (not managed here)
3. Queries can be run against this table via Athena or other Glue consumers
4. 12 columns store inventory metadata (resource, CSP, region, integrations, attributes)

---

## 8. Notable Decisions & Caveats

### Design Decisions

1. **Module-based approach:** The single `glue_catalog_table` module is called via `for_each` even though there is currently only one table. This allows future expansion to multiple tables by simply adding more entries to the `glue_catalog_tables` map without changing `.tf` code.

2. **Catalog ID is explicit:** The catalog ID is set to `"790543352839"` (the AWS account ID) rather than relying on the implicit provider default. This ensures clarity and avoids accidental cross-account misconfigurations.

3. **Full storage descriptor:** All storage descriptor fields are modeled, including:
   - All 12 columns with explicit name and type
   - SerDe library and parameters
   - Empty skewed_info and sort_columns (present but empty as discovered)
   - Bucket columns list (empty)

4. **Dynamic blocks for nested objects:** The module uses Terraform `dynamic` blocks for `storage_descriptor`, `ser_de_info`, `skewed_info`, and `sort_columns`. This allows the configuration to gracefully handle optional sub-structures without generating syntax errors.

5. **No `lifecycle { ignore_changes }`:** No computed or write-only attributes are managed in this resource, so no `ignore_changes` blocks are needed. All state attributes are stable and discoverable.

6. **Table parameters preserved:** The Glue table parameters `EXTERNAL = "TRUE"` and `transient_lastDdlTime = "1773989865"` are stored as-is from discovery. These are metadata flags and should rarely change during normal operation.

### Known Limitations & Caveats

1. **Database not managed:** The Glue database `dev_pedro_chaves_data_lake` is referenced but not managed by this module. If the database is deleted externally, the table will fail to function. The database should be managed in a separate Terraform module or module set.

2. **Partition keys not supported by this table:** The discovered table has no partition keys (empty list). If you need to add partition keys later, they must be added manually to the cloud resource or via a separate Terraform apply after modifying `variables.tf`.

3. **Table location is S3-specific:** The table's storage location is an S3 path. If you need to migrate the table to a different S3 location or a different data lake, you must update the `location` field in `storage_descriptor` and run `terraform apply`.

4. **Owner is a string, not a managed identity:** The table owner is set to the string `"hadoop"`. Glue does not enforce identity verification for table ownership, so this is informational only.

5. **No table versioning:** Terraform does not track or manage the Glue table's version ID (currently `"0"`). Manual modifications to the live table (via AWS Console or Glue API) will not be detected by `terraform plan` until the state is refreshed or the resource is re-imported.

6. **SerDe parameters immutable at import:** The SerDe serialization library and parameters are discovered and stored as-is. Changing the serialization library after import may require a table recreation rather than an in-place update, depending on AWS Glue's validation rules.

### Import History

- **Iteration 1:** Resource imported successfully. Configuration was immediately reconciled with zero drift. `terraform plan` showed 0 additions, 0 changes, 0 deletions on first run.
- **Iterations 2+:** None required. Configuration is stable.

### Drift Detection

To check for drift between the current configuration and the live cloud resource:

```bash
terraform plan -var-file=environments/sg.tfvars
```

If any drift is detected, review the diff and decide whether to:
- Update `.tfvars` to match the live resource (if the live change is intentional)
- Apply the Terraform changes (if the configuration should override the live state)
- Investigate the external change (if it's unexpected)

---

## 9. Quick Reference

### Common Commands

| Goal | Command |
|---|---|
| Initialize | `terraform init` |
| Validate syntax | `terraform validate` |
| View plan | `terraform plan -var-file=environments/sg.tfvars` |
| Apply changes | `terraform apply -var-file=environments/sg.tfvars` |
| View state | `terraform show` |
| List resources | `terraform state list` |
| Show resource details | `terraform state show 'module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this'` |
| Re-import | `terraform import -var-file=environments/sg.tfvars 'module.glue_catalog_table["temp_bronze_inventory_35dcc724"].aws_glue_catalog_table.this' '790543352839:dev_pedro_chaves_data_lake:temp_bronze_inventory_35dcc724'` |
| Destroy | `terraform destroy -var-file=environments/sg.tfvars` |

### Files Overview

| File | Purpose |
|---|---|
| `main.tf` | Root module with `for_each` instantiation of `glue_catalog_table` |
| `variables.tf` | Root input variable `glue_catalog_tables` |
| `outputs.tf` | Root outputs (empty; module outputs not aggregated) |
| `providers.tf` | AWS provider configuration (region: eu-central-1) |
| `versions.tf` | Terraform and provider requirements |
| `environments/sg.tfvars` | Current environment variable values |
| `imports.sh` | Shell script with `terraform import` command (run once at bootstrap) |
| `modules/glue_catalog_table/` | Reusable module for Glue Catalog tables |
| `.sg/handoff.md` | Infrastructure metadata and import notes |
| `.sg/DOCUMENTATION.md` | This file |

---

**Document generated:** 2026-07-21  
**Last reconciliation:** No changes. Infrastructure matches configuration.  
**Managed by:** Terraform code generation and reconciliation workflow
