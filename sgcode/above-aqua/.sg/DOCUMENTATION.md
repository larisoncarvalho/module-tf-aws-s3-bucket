# Infrastructure as Code Documentation

**Generated:** 2026-06-04  
**Project:** StackGuardian GCP BigQuery Infrastructure  
**Status:** Reconciled (0 changes)

---

## 1. Overview

This Terraform/OpenTofu codebase manages Google Cloud BigQuery datasets for the StackGuardian GCP infrastructure. The code was **automatically generated** from discovered cloud resources discovered in the `stackguardian-nonprod` GCP project, then **imported into state** using the `terraform import` command. 

### Key Facts
- **Generated from:** Cloud resource discovery for `stackguardian-nonprod` GCP project
- **Reconciliation status:** Complete — `terraform plan` shows 0/0/0 (no drifts, additions, or deletions)
- **Primary infrastructure:** 1 Google BigQuery dataset with fine-grained access control
- **Region:** EU
- **Provider:** Google Cloud Platform (GCP) via Terraform's `hashicorp/google` provider

### What was done
1. Discovered the existing BigQuery dataset `sg_infra_2_code` in GCP
2. Generated Terraform code to represent this resource (as a reusable module)
3. Imported the discovered dataset into Terraform state using `terraform import`
4. Verified state matches configuration (plan shows no changes)

---

## 2. Resources

All resources are managed through a reusable `bigquery_dataset` module called via `for_each`.

| Terraform Address | Provider Type | Cloud Name/ID | Purpose |
|---|---|---|---|
| `module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this` | `google_bigquery_dataset` | `stackguardian-nonprod:sg_infra_2_code` | BigQuery dataset for StackGuardian infrastructure code scanning and test data storage |

### Resource Details

#### BigQuery Dataset: `sg_infra_2_code`
- **Project:** `stackguardian-nonprod`
- **Location:** EU
- **Dataset ID:** `sg_infra_2_code`
- **Description:** (empty string)
- **Labels:** None
- **Access Control:**
  - `WRITER` role: `projectWriters` special group
  - `OWNER` role: `projectOwners` special group
  - `OWNER` role: `digbijayinee.clara@stackguardian.io` (user email)
  - `READER` role: `projectReaders` special group
- **Tables referenced:**
  - `students` (within the same dataset)
  - `tabela_teste` (from `ds_tf_test` dataset)
  - `sample` (from `inv_scan_dataset` dataset)

---

## 3. Module Structure

### Local Modules

```
modules/
└── bigquery_dataset/
    ├── main.tf          # Defines google_bigquery_dataset.this resource
    ├── variables.tf     # Input variables (dataset_id, project, location, etc.)
    └── outputs.tf       # Output values (dataset_id, self_link)
```

#### Module: `bigquery_dataset`

**Purpose:** Encapsulates the Google BigQuery dataset resource with configurable access control, labels, and metadata.

**Usage:** Called from root via `for_each` for multi-dataset management:
```hcl
module "bigquery_dataset" {
  source   = "./modules/bigquery_dataset"
  for_each = var.bigquery_datasets
  
  dataset_id  = each.value.dataset_id
  project     = each.value.project
  location    = each.value.location
  description = each.value.description
  labels      = each.value.labels
  access      = each.value.access
}
```

**Key Capabilities:**
- Dynamic access control list (ACL) configuration via `for_each` over the `access` list
- Optional description and labels
- Support for multiple access entry types: special groups, user emails, group emails, domains, and IAM members
- Exports dataset ID and self-link URI for downstream references

---

## 4. How Import Works

### Import Command

The discovered BigQuery dataset was imported using:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this' \
  'stackguardian-nonprod/sg_infra_2_code'
```

This command is stored in `imports.sh` and was executed once during the initial setup phase.

### Import Mechanics

1. **Address format:** `module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this`
   - `module.bigquery_dataset` = root module call name
   - `["sg_infra_2_code"]` = `for_each` key (matches `bigquery_datasets` map key)
   - `google_bigquery_dataset.this` = resource type and logical name in the module

2. **Cloud ID:** `stackguardian-nonprod/sg_infra_2_code`
   - Format: `<GCP_PROJECT_ID>/<DATASET_ID>`
   - Used by Terraform's Google provider to locate the actual cloud resource

3. **Variable file:** `environments/sg.tfvars` provides the dataset configuration that matches the cloud state

### Re-importing a Single Resource

If Terraform state is lost or corrupted, re-import the dataset:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this' \
  'stackguardian-nonprod/sg_infra_2_code'
```

Ensure `environments/sg.tfvars` is configured with the correct dataset settings before re-importing.

---

## 5. How to Use the Code

### Prerequisites

- Terraform/OpenTofu CLI installed (version matching `versions.tf` requirements)
- GCP credentials configured (via `GOOGLE_APPLICATION_CREDENTIALS` or `gcloud auth`)
- Write access to the GCP project `stackguardian-nonprod`

### Workflow

#### Step 1: Initialize Terraform

```bash
cd /mnt/sg_workspace/user/sgcode
terraform init
```

This downloads the Google provider and initializes the backend (local by default).

#### Step 2: Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output (reconciled state):
```
No changes. Infrastructure matches configuration.
```

#### Step 3: Apply Configuration

```bash
terraform apply -var-file=environments/sg.tfvars -auto-approve
```

Normally produces no changes, but will apply any drift corrections if discovered.

### Targeting Another Environment

To manage a **different GCP project or dataset configuration** (e.g., production):

1. **Copy the variables file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to point to your target project/dataset:
   ```hcl
   bigquery_datasets = {
     prod_dataset = {
       dataset_id  = "prod_dataset"
       project     = "stackguardian-prod"
       location    = "US"
       description = "Production infrastructure dataset"
       labels      = {}
       access = [
         {
           role          = "OWNER"
           special_group = "projectOwners"
         },
         # ... additional access rules
       ]
     }
   }
   ```

3. **Plan and apply with the new file** (no `.tf` edits needed):
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars -auto-approve
   ```

### Example: Adding a New Dataset

To add another BigQuery dataset without modifying `.tf` files:

1. Edit `environments/sg.tfvars`:
   ```hcl
   bigquery_datasets = {
     sg_infra_2_code = {
       # ... existing config
     },
     new_dataset = {
       dataset_id  = "new_dataset"
       project     = "stackguardian-nonprod"
       location    = "EU"
       description = "New dataset for testing"
       labels      = { env = "test", owner = "platform" }
       access = [
         {
           role          = "OWNER"
           special_group = "projectOwners"
         }
       ]
     }
   }
   ```

2. Plan:
   ```bash
   terraform plan -var-file=environments/sg.tfvars
   ```

3. Apply:
   ```bash
   terraform apply -var-file=environments/sg.tfvars -auto-approve
   ```

---

## 6. Variables

### Root-Level Input Variables

#### `bigquery_datasets` (map of objects)

**Type:** `map(object({...}))`  
**Required:** No (default: `{}`)  
**Description:** Map of BigQuery datasets to manage. Each key becomes the dataset's Terraform address suffix (via `for_each`).

**Schema:**

```hcl
bigquery_datasets = {
  <dataset_key> = {
    dataset_id        = string              # Required: BigQuery dataset ID
    project           = string              # Required: GCP project ID
    location          = string              # Required: Dataset region (e.g., "EU", "US")
    description       = optional(string, "")
    labels            = optional(map(string), {})
    access = optional(list(object({
      role            = string              # "OWNER", "WRITER", "READER"
      special_group   = optional(string)    # "projectOwners", "projectWriters", etc.
      user_by_email   = optional(string)    # Email address of a user
      group_by_email  = optional(string)    # Email address of a group
      domain          = optional(string)    # Domain name for domain access
      iam_member      = optional(string)    # IAM principal (service account, etc.)
    })), [])
  },
  # ... additional datasets
}
```

**Current Value (from `environments/sg.tfvars`):**

```hcl
bigquery_datasets = {
  sg_infra_2_code = {
    dataset_id  = "sg_infra_2_code"
    project     = "stackguardian-nonprod"
    location    = "EU"
    description = ""
    labels      = {}
    access = [
      { role = "WRITER", special_group = "projectWriters" },
      { role = "OWNER", special_group = "projectOwners" },
      { role = "OWNER", user_by_email = "digbijayinee.clara@stackguardian.io" },
      { role = "READER", special_group = "projectReaders" }
    ]
  }
}
```

### Module-Level Input Variables

(Defined in `modules/bigquery_dataset/variables.tf`)

| Variable | Type | Required | Default | Description |
|---|---|---|---|---|
| `dataset_id` | string | Yes | — | BigQuery dataset ID |
| `project` | string | Yes | — | GCP project ID |
| `location` | string | Yes | — | Dataset location/region |
| `description` | string | No | `""` | Dataset description |
| `labels` | `map(string)` | No | `{}` | Labels to apply to the dataset |
| `access` | `list(object(...))` | No | `[]` | Access control entries |

### Outputs

#### Root Output: `bigquery_dataset_ids`

**Type:** `map(string)`  
**Description:** Maps each dataset key to its BigQuery dataset ID.

**Example:**
```hcl
output "bigquery_dataset_ids" {
  value = {
    sg_infra_2_code = "sg_infra_2_code"
  }
}
```

#### Module Output: `dataset_id`

**Type:** `string`  
**Description:** The dataset ID of the created BigQuery dataset.

#### Module Output: `self_link`

**Type:** `string`  
**Description:** The URI of the created BigQuery dataset (e.g., `https://bigquery.googleapis.com/bigquery/v2/projects/stackguardian-nonprod/datasets/sg_infra_2_code`).

---

## 7. Infrastructure Graph

### Dependency Tree

```
google_bigquery_dataset (sg_infra_2_code)
├── project: stackguardian-nonprod
├── location: EU
└── access_control (4 entries)
    ├── WRITER: projectWriters group
    ├── OWNER: projectOwners group
    ├── OWNER: digbijayinee.clara@stackguardian.io
    └── READER: projectReaders group

Referenced Tables (discovered):
├── students (within sg_infra_2_code)
├── tabela_teste (from ds_tf_test dataset)
└── sample (from inv_scan_dataset dataset)
```

### Module Instantiation Graph

```
Root Module
└── module.bigquery_dataset (for_each)
    └── sg_infra_2_code [key]
        └── google_bigquery_dataset.this
            └── google_bigquery_dataset (cloud resource)
```

---

## 8. Notable Decisions & Caveats

### Design Decisions

1. **For-each over count:** The root module uses `for_each` instead of `count`, enabling:
   - Named dataset instances (e.g., `sg_infra_2_code` key)
   - Stable addresses when adding/removing datasets
   - Clearer resource referencing

2. **Dynamic access blocks:** The module uses Terraform's `dynamic` block to iterate over the `access` list, avoiding hardcoding ACL entries and supporting any number of access rules.

3. **Optional fields:** Description and labels are optional with sensible defaults (empty string and empty map), reducing boilerplate for minimal datasets.

4. **Local module approach:** The `bigquery_dataset` module is co-located rather than external (no git source), enabling:
   - Full version control with the infrastructure
   - Easy customization without forking external repositories
   - Reduced external dependency complexity

### Imported vs. Managed

- The discovered dataset `sg_infra_2_code` was **imported** (not created by Terraform) to establish a baseline state matching the cloud.
- Any future changes to the dataset (access, labels, description) must be made through Terraform variables and applied with `terraform apply`.
- Drift detection: If the cloud dataset is manually altered outside Terraform, `terraform plan` will show corrections needed.

### Computed Fields Not in Configuration

Terraform omits these computed-only fields from the `.tf` files (present in cloud state but not user-configurable):

- `creation_time` — timestamp when the dataset was created
- `last_modified_time` — timestamp of last modification
- `etag` — resource version/change detection token
- `kind` — API response type indicator
- `id` — internal BigQuery dataset identifier

These are tracked in state but not configured in code.

### Remaining Drift

**None.** The reconciliation result shows:
```
No changes. Infrastructure matches configuration.
```

The imported dataset's access rules, location, and metadata align perfectly with the Terraform configuration in `environments/sg.tfvars`.

### Limitations

1. **No automatic cleanup:** Destroying the Terraform configuration with `terraform destroy` will delete the BigQuery dataset, including all tables. Use with caution in production.

2. **Access control complexity:** BigQuery access is role-based (OWNER, WRITER, READER) and group-based. Removing an access entry requires re-applying without that entry; there is no built-in "deny" mechanism in Terraform for BigQuery.

3. **No table management:** This IaC only manages datasets, not individual tables. Tables referenced in the discovery (`students`, `tabela_teste`, `sample`) are outside Terraform's scope.

4. **Single region:** Each dataset must specify a single location. Multi-region datasets are not currently supported by this module.

---

## 9. File Structure

```
/mnt/sg_workspace/user/sgcode/
├── .sg/
│   └── DOCUMENTATION.md          # This file
├── main.tf                         # Root module definition (calls bigquery_dataset)
├── variables.tf                    # Root input variables (bigquery_datasets)
├── outputs.tf                      # Root outputs (bigquery_dataset_ids)
├── providers.tf                    # Provider configuration (google)
├── versions.tf                     # Required provider versions
├── imports.sh                      # Import script (executed once)
├── environments/
│   └── sg.tfvars                  # Variable file for nonprod environment
├── modules/
│   └── bigquery_dataset/
│       ├── main.tf                # google_bigquery_dataset.this resource
│       ├── variables.tf           # Module input variables
│       └── outputs.tf             # Module outputs (dataset_id, self_link)
└── .terraform/                    # (local backend state after init)
```

---

## 10. Troubleshooting

### Issue: `terraform plan` shows changes when none are expected

**Cause:** State drift or variable mismatch.

**Solution:**
1. Check variable values: `terraform var -var-file=environments/sg.tfvars | grep bigquery_datasets`
2. Verify cloud resource hasn't been manually modified outside Terraform
3. Re-import if state was lost: `bash imports.sh /path/to/terraform`

### Issue: Import fails with "resource not found"

**Cause:** Cloud resource doesn't exist or credentials are invalid.

**Solution:**
1. Verify credentials: `gcloud auth list` and `gcloud config get-value project`
2. Check resource exists: `gcloud bigquery datasets describe sg_infra_2_code --project=stackguardian-nonprod`
3. Ensure `project` in `sg.tfvars` matches the resource's actual project

### Issue: Permission denied on apply

**Cause:** GCP credentials lack required permissions.

**Solution:**
1. Ensure your GCP service account or user has:
   - `bigquery.datasets.create`
   - `bigquery.datasets.update`
   - `bigquery.datasets.get`
   - Roles: `roles/bigquery.dataEditor` or `roles/bigquery.admin`
2. Test: `gcloud bigquery datasets list --project=stackguardian-nonprod`

---

**Last Updated:** 2026-06-04  
**Terraform Version:** See `versions.tf`  
**Provider:** Google (`hashicorp/google`)
