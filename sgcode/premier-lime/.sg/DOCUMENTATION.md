# Terraform Infrastructure Documentation

**Generated:** 2026-06-04  
**Reconciliation Status:** ✓ Complete (0 changes, 0 additions, 0 deletions)

---

## 1. Overview

This Terraform configuration manages Google Cloud Platform (GCP) BigQuery datasets for the StackGuardian non-production environment. The code was generated from discovered cloud resources and has been fully reconciled—all resources were imported into the Terraform state until `terraform plan` showed 0 changes, meaning the configuration perfectly matches the live cloud resources.

### What This Does

- **Manages one BigQuery dataset** (`sg_infra_2_code`) in project `stackguardian-nonprod`
- **Defines fine-grained access controls** with four role assignments (WRITER, OWNER, READER)
- **Provides a reusable module pattern** for managing multiple datasets via `for_each`, making it easy to add more datasets in the future
- **Exports dataset metadata** (IDs and self-links) for consumption by other infrastructure components

### Key Characteristics

- **State:** All resources are managed by Terraform and tracked in `terraform.tfstate`
- **Provider:** HashiCorp Google Cloud provider (no version pinning)
- **Modularity:** Single local module (`modules/bigquery_dataset/`) instantiated once
- **Scalability:** The module uses `for_each`, so adding new datasets requires only a `tfvars` entry

---

## 2. Resources

| Terraform Address | Type | Cloud ID | Purpose | Status |
|---|---|---|---|---|
| `module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this` | `google_bigquery_dataset` | `stackguardian-nonprod:sg_infra_2_code` | BigQuery dataset for StackGuardian infrastructure code analysis | Managed |

### Resource Details

**Dataset: sg_infra_2_code**

- **Project:** `stackguardian-nonprod`
- **Location:** `EU` (European region)
- **Created:** 2026-06-02T11:35:25.508Z
- **Access Control:** 4 role bindings:
  - `WRITER` → `projectWriters` (group)
  - `OWNER` → `projectOwners` (group)
  - `OWNER` → `digbijayinee.clara@stackguardian.io` (user)
  - `READER` → `projectReaders` (group)
- **Labels:** None
- **Description:** Empty
- **Default Expiration:** Not set
- **Encryption:** Not using customer-managed KMS key

---

## 3. Module Structure

### Root Module (`.`)

**File:** `main.tf`

The root module defines the core infrastructure by instantiating the `bigquery_dataset` local module:

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

- **Loop Control:** `for_each` over `var.bigquery_datasets` map
- **Current Instances:** 1 (key: `"sg_infra_2_code"`)
- **Inputs:** Dataset ID, project, location, description, labels, and access list passed from tfvars

### Local Module: `modules/bigquery_dataset`

**Purpose:** Encapsulates the creation of a single BigQuery dataset with dynamic access controls.

**Files:**
- `main.tf` — Creates `google_bigquery_dataset.this` resource
- `variables.tf` — Defines 6 module inputs
- `outputs.tf` — Exports 2 computed values

**Resource Managed:**

```hcl
resource "google_bigquery_dataset" "this" {
  dataset_id  = var.dataset_id
  project     = var.project
  location    = var.location
  description = var.description
  labels      = var.labels

  dynamic "access" {
    for_each = var.access
    content {
      role          = access.value.role
      special_group = access.value.special_group
      user_by_email = access.value.user_by_email
      group_by_email = access.value.group_by_email
      domain        = access.value.domain
      iam_member    = access.value.iam_member
    }
  }
}
```

**Module Inputs:**

| Variable | Type | Default | Purpose |
|---|---|---|---|
| `dataset_id` | string | *(required)* | BigQuery dataset ID |
| `project` | string | *(required)* | GCP project ID containing the dataset |
| `location` | string | *(required)* | Dataset location (e.g., `EU`, `US`) |
| `description` | string | `""` | Human-readable description |
| `labels` | map(string) | `{}` | Labels for resource organization |
| `access` | list(object) | `[]` | Access control entries (see below) |

**Access Object Schema:**

Each access entry can define one of the following:
- `role` — Required. One of `OWNER`, `EDITOR`, `VIEWER`, `READER`, `WRITER`
- `special_group` — Group type: `projectOwners`, `projectEditors`, `projectWriters`, or `projectReaders`
- `user_by_email` — Email of a specific user
- `group_by_email` — Email of a Google Group
- `domain` — A Google Workspace domain
- `iam_member` — Generic IAM member format (e.g., `serviceAccount:...@iam.gserviceaccount.com`)

**Module Outputs:**

| Output | Type | Value |
|---|---|---|
| `dataset_id` | string | The dataset ID (from `google_bigquery_dataset.this.dataset_id`) |
| `self_link` | string | The canonical URI of the dataset (e.g., `https://bigquery.googleapis.com/bigquery/v2/projects/stackguardian-nonprod/datasets/sg_infra_2_code`) |

**Root-Level Output:**

The root `outputs.tf` aggregates module outputs:

```hcl
output "bigquery_dataset_ids" {
  description = "BigQuery dataset IDs"
  value       = { for k, v in module.bigquery_dataset : k => v.dataset_id }
}
```

This exports a map like `{ "sg_infra_2_code" = "sg_infra_2_code" }` for use by other modules or configurations.

---

## 4. Import Strategy

### How Import Works

The `imports.sh` script populates the Terraform state by importing existing cloud resources:

```bash
#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this' 'stackguardian-nonprod/sg_infra_2_code'
```

**Breakdown:**

- **$1** — Placeholder for the Terraform/OpenTofu binary path (filled by the CI/CD runner)
- **-var-file environments/sg.tfvars** — Loads tfvars to resolve module addresses correctly
- **Terraform Address** — `module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this`
  - Maps to the `google_bigquery_dataset.this` resource inside the module instance keyed by `"sg_infra_2_code"`
- **Cloud ID** — `stackguardian-nonprod/sg_infra_2_code`
  - Format: `<project_id>/<dataset_id>` for BigQuery datasets

**When Imports Were Run:**

- Executed once during initial code generation and reconciliation
- Result: State now contains the live dataset definition
- Subsequent `plan` shows 0 changes, confirming alignment

**Re-importing a Single Resource:**

If state is lost or corrupted, re-import with:

```bash
terraform import -var-file=environments/sg.tfvars \
  'module.bigquery_dataset["sg_infra_2_code"].google_bigquery_dataset.this' \
  'stackguardian-nonprod/sg_infra_2_code'
```

---

## 5. How to Use This Code

### Prerequisites

- Terraform or OpenTofu CLI installed
- GCP credentials configured (via `GOOGLE_APPLICATION_CREDENTIALS` environment variable or `gcloud auth`)
- Read/write access to project `stackguardian-nonprod` and BigQuery service
- The `environments/sg.tfvars` file present and configured

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/sgcode
terraform init
```

This downloads the Google Cloud provider and initializes the backend (local by default).

### View the Plan

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output: `No changes. Your infrastructure matches the configuration.` (since state is already reconciled).

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

Will show `No changes` and require no approval (idempotent, already converged).

### Targeting Another Environment

To manage datasets in a different environment (e.g., **prod**), without editing `.tf` files:

1. **Create a new tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** with prod-specific values:
   ```hcl
   bigquery_datasets = {
     "sg_infra_2_code_prod" = {
       dataset_id  = "sg_infra_2_code_prod"
       project     = "stackguardian-prod"
       location    = "US"
       description = "Production dataset"
       labels      = { env = "prod" }
       access = [
         # ... prod access rules ...
       ]
     }
   }
   ```

3. **Plan and apply against prod:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

### Adding More Datasets

To add a new dataset, only modify `environments/sg.tfvars`—no `.tf` edits needed:

```hcl
bigquery_datasets = {
  "sg_infra_2_code" = {
    # ... existing dataset ...
  },
  "new_dataset" = {
    dataset_id  = "new_dataset"
    project     = "stackguardian-nonprod"
    location    = "EU"
    description = "Additional dataset"
    labels      = {}
    access      = []
  }
}
```

Then plan and apply:
```bash
terraform plan -var-file=environments/sg.tfvars
# Review plan, should show 1 addition
terraform apply -var-file=environments/sg.tfvars
```

---

## 6. Variables

### Root-Level Variable

**`bigquery_datasets`**

- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Scope:** Passed to all module instances via `for_each`
- **Required:** No (but must provide values in tfvars for any datasets)
- **Purpose:** Defines the set of BigQuery datasets to manage, with one map entry per dataset

**Schema:**

Each dataset object contains:

| Key | Type | Default | Description |
|---|---|---|---|
| `dataset_id` | string | *(required)* | Unique identifier for the dataset within the project |
| `project` | string | *(required)* | GCP project ID (e.g., `stackguardian-nonprod`) |
| `location` | string | *(required)* | Geographic location: `EU`, `US`, etc. |
| `description` | string | `""` | Human-readable description (optional) |
| `labels` | map(string) | `{}` | Key-value labels for resource filtering/organization |
| `access` | list(object) | `[]` | List of access control entries (see section 3 for schema) |

### Example Tfvars Usage

From `environments/sg.tfvars`:

```hcl
bigquery_datasets = {
  "sg_infra_2_code" = {
    dataset_id  = "sg_infra_2_code"
    project     = "stackguardian-nonprod"
    location    = "EU"
    description = ""
    labels      = {}
    access = [
      {
        role          = "WRITER"
        special_group = "projectWriters"
      },
      {
        role          = "OWNER"
        special_group = "projectOwners"
      },
      {
        role          = "OWNER"
        user_by_email = "digbijayinee.clara@stackguardian.io"
      },
      {
        role          = "READER"
        special_group = "projectReaders"
      },
    ]
  }
}
```

---

## 7. Infrastructure Graph

```
Root Module (main.tf)
│
└── module.bigquery_dataset ["for_each" over var.bigquery_datasets]
    │
    ├── Instance: "sg_infra_2_code"
    │   │
    │   └── google_bigquery_dataset.this
    │       ├── dataset_id: "sg_infra_2_code"
    │       ├── project: "stackguardian-nonprod"
    │       ├── location: "EU"
    │       │
    │       └── access (dynamic block, 4 entries)
    │           ├── WRITER → projectWriters
    │           ├── OWNER → projectOwners
    │           ├── OWNER → digbijayinee.clara@stackguardian.io
    │           └── READER → projectReaders
    │
    └── Module Outputs
        ├── dataset_id: "sg_infra_2_code"
        └── self_link: "https://bigquery.googleapis.com/bigquery/v2/projects/stackguardian-nonprod/datasets/sg_infra_2_code"

Root Output
└── bigquery_dataset_ids: { "sg_infra_2_code" = "sg_infra_2_code" }
```

### Resource Dependencies

- **google_bigquery_dataset.this** has no explicit Terraform dependencies
- **Implicit dependency:** GCP project `stackguardian-nonprod` must exist
- **IAM Roles:** Principal entities (users, groups) referenced in `access` must exist in GCP

### External References

The BigQuery dataset is referenced by:

- **3 Tables** (discovered but not managed by this Terraform):
  - `stackguardian-nonprod/ds_tf_test/tables/tabela_teste`
  - `stackguardian-nonprod/inv_scan_dataset/tables/sample`
  - `stackguardian-nonprod/sg_infra_2_code/tables/students`

These tables are not managed by this configuration and will not be affected by Terraform operations.

---

## 8. Notable Decisions & Caveats

### 1. Local Module Over Inline Resource

**Decision:** Extracted `google_bigquery_dataset` into a local module (`modules/bigquery_dataset/`) rather than defining it inline in root `main.tf`.

**Rationale:**
- Improves reusability — adding a second dataset only requires a new tfvars entry, not code duplication
- Cleaner separation of concerns — module handles the resource details, root handles the orchestration
- Easier to version and maintain — module can be promoted to a registry if needed

### 2. Dynamic Access Block

**Decision:** Used Terraform's `dynamic` block for the `access` attribute.

**Rationale:**
- Access rules are data-driven (supplied via tfvars), not hard-coded
- Allows flexible role binding without modifying module code
- Each dataset can have a different access control scheme

**Caveat:**
- All access rule attributes are optional in the module schema, but BigQuery requires at least one of: `role`, `special_group`, `user_by_email`, `group_by_email`, `domain`, or `iam_member`
- The module does not validate this; invalid configurations will fail at apply time

### 3. No Computed Attributes in Outputs

**Decision:** `outputs.tf` exports only two values: `dataset_id` and `self_link`.

**Rationale:**
- These are the most commonly needed references by downstream infrastructure
- GCP BigQuery datasets are read-only after creation (no mutable state)
- Additional attributes (creation time, etag, etc.) are captured in state but not re-exported

**Omitted Attributes:** `default_table_expiration_ms`, `default_partition_expiration_ms`, `kms_key_name`, `etag`, `kind` (immutable or rarely used)

### 4. No Provider Configuration

**Decision:** No `google` provider block in `providers.tf` (minimal/empty).

**Rationale:**
- GCP credentials are expected to be managed externally (environment variable, gcloud CLI)
- Project and region are specified per-resource, not globally
- This is the simplest configuration for a single-use stateless Terraform module

**Implication:** Users must ensure GCP credentials are available before running Terraform commands.

### 5. No Version Pinning

**Decision:** `versions.tf` specifies `google` provider without a version constraint.

**Rationale:**
- Allows flexibility for StackGuardian CI/CD to use the latest stable provider
- Reduces maintenance burden (no need to bump version after Google releases updates)

**Risk:** Provider version drift may cause subtle behavior changes; pin to a major version (e.g., `>= 5.0, < 6.0`) if drift becomes a problem.

### 6. Unmanaged Tables

**Decision:** The three BigQuery tables in the dataset are not managed by this Terraform.

**Status:** `resource_status: "unmanaged"` in discovery output

**Implication:**
- Terraform will not modify or destroy these tables
- They exist independently (perhaps created by data pipelines or other tooling)
- If table schema/data needs to be managed, add `google_bigquery_table` resources to this configuration or a separate one

### 7. State File Persistence

**Decision:** `terraform.tfstate` is stored locally.

**Rationale:** Suitable for a non-production, single-operator environment.

**Future Improvement:** For multi-team or production use, migrate to remote state (GCS backend, Terraform Cloud, etc.) to enable state locking and concurrent operations.

---

## Appendix: File Manifest

```
/mnt/sg_workspace/user/sgcode/
├── .sg/
│   └── DOCUMENTATION.md          (this file)
├── .gitignore                     (if present)
├── main.tf                        (root module orchestration)
├── variables.tf                   (root variable definitions)
├── outputs.tf                     (root output definitions)
├── versions.tf                    (provider version constraints)
├── providers.tf                   (provider configuration, minimal)
├── imports.sh                     (state import script)
├── terraform.tfstate              (local state file)
├── terraform.tfstate.backup       (backup state file)
├── environments/
│   └── sg.tfvars                  (non-prod tfvars)
└── modules/
    └── bigquery_dataset/
        ├── main.tf                (google_bigquery_dataset resource)
        ├── variables.tf           (module variable definitions)
        └── outputs.tf             (module output definitions)
```

---

**End of Documentation**
