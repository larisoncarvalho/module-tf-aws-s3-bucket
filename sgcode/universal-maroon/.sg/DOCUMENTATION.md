# Infrastructure Documentation

**Generated:** 2026-06-04  
**Status:** Reconciled (plan shows 0/0/0)  
**IaC Tool:** Terraform/OpenTofu  
**Cloud Provider:** Google Cloud Platform (GCP)

---

## Overview

This codebase manages Google Cloud KMS (Key Management Service) infrastructure. The code was automatically generated from discovered cloud resources and imported into Terraform state. All resources have been reconciled—the current state matches the configuration exactly (no planned changes, additions, or deletions).

### What Was Done
1. **Discovery:** One KMS Key Ring was discovered in the GCP project `stackguardian-nonprod`
2. **Code Generation:** Terraform configuration was generated to represent this resource
3. **Import:** The resource was imported into Terraform state via `imports.sh`
4. **Reconciliation:** The configuration was validated until `terraform plan` showed **0 add, 0 change, 0 destroy**

---

## Resources

| Terraform Address | Provider Type | Cloud Name/ID | Purpose |
|---|---|---|---|
| `module.kms_key_ring["arunim-gcp-bucket-2"].google_kms_key_ring.this` | `google_kms_key_ring` | `arunim-gcp-bucket-2` (KMS Key Ring in `stackguardian-nonprod`) | Encryption key management; stores cryptographic keys for securing cloud resources |

### Resource Details

**KMS Key Ring: arunim-gcp-bucket-2**
- **Name:** `arunim-gcp-bucket-2`
- **Location:** `us` (global/multi-region)
- **Project:** `stackguardian-nonprod`
- **Created:** 2024-10-14T10:46:29Z
- **Integrations:** This resource is tracked across four StackGuardian integrations:
  - `/integrations/refeed-gcp-test1-83yfu2qc`
  - `/integrations/refeed-infra2code-oidc-new-m01ue17s`
  - `/integrations/infra2code-gcp-oidc-vkyoey3x`
  - `/integrations/infra2code-gcp-ezt3xbu8`

---

## Module Structure

### Local Module: `modules/kms_key_ring/`

**Purpose:** Encapsulates the configuration for a single KMS Key Ring resource

**Files:**
- `main.tf` — Defines the `google_kms_key_ring` resource
- `variables.tf` — Input parameters: `name`, `location`, `project`
- `outputs.tf` — Exports the key ring's `id`

**Input Variables:**
- `name` (string) — The name of the KMS key ring
- `location` (string) — The geographic location (e.g., "us", "europe-west1")
- `project` (string) — The GCP project ID

**Outputs:**
- `id` — The full resource ID of the key ring (used for reference by other resources or data sources)

**Calling Pattern (root `main.tf`):**
```hcl
module "kms_key_ring" {
  source   = "./modules/kms_key_ring"
  for_each = var.kms_key_rings

  name     = each.value.name
  location = each.value.location
  project  = each.value.project
}
```

The root module uses `for_each` to instantiate one module invocation per entry in the `kms_key_rings` variable map, allowing multiple key rings to be managed.

---

## How Import Works

### Import Process

The discovered KMS Key Ring was imported into state using the `imports.sh` script.

**Script Location:** `imports.sh`

**Script Content:**
```bash
#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars \
  'module.kms_key_ring["arunim-gcp-bucket-2"].google_kms_key_ring.this' \
  'projects/stackguardian-nonprod/locations/us/keyRings/arunim-gcp-bucket-2'
```

**How It Works:**
1. The script calls the Terraform/OpenTofu binary (passed as `$1`)
2. It references the module-qualified address: `module.kms_key_ring["arunim-gcp-bucket-2"].google_kms_key_ring.this`
3. It provides the cloud resource ID: `projects/stackguardian-nonprod/locations/us/keyRings/arunim-gcp-bucket-2`
4. The `-var-file environments/sg.tfvars` flag ensures the correct variable values are available during import

**When to Re-Import a Single Resource**

If the resource state is lost or corrupted, re-import it with:
```bash
terraform import -var-file=environments/sg.tfvars \
  'module.kms_key_ring["arunim-gcp-bucket-2"].google_kms_key_ring.this' \
  'projects/stackguardian-nonprod/locations/us/keyRings/arunim-gcp-bucket-2'
```

Or use the provided script:
```bash
sh imports.sh terraform
```

---

## How to Use the Code

### Prerequisites
- Terraform or OpenTofu binary installed
- GCP credentials configured (via `GOOGLE_APPLICATION_CREDENTIALS` or `gcloud auth`)
- The GCP project `stackguardian-nonprod` must be accessible

### Initialize the Working Directory
```bash
cd /mnt/sg_workspace/user/sgcode
terraform init
```

This downloads the required Google provider and prepares the local backend.

### Plan Changes
To review what Terraform will do (currently: no changes):
```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output: `No changes. Infrastructure matches configuration.`

### Apply Changes
To create, modify, or destroy resources (currently: nothing to do):
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting a Different Environment

The configuration is environment-agnostic. To manage a different GCP project or region:

1. **Copy the environment file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to update the GCP project and key ring names:
   ```hcl
   # environments/prod.tfvars
   kms_key_rings = {
     "prod-kms-key-ring" = {
       name     = "prod-kms-key-ring"
       location = "us"
       project  = "my-prod-project"
     }
   }
   ```

3. **Plan for the new environment:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   ```

4. **Apply to the new environment:**
   ```bash
   terraform apply -var-file=environments/prod.tfvars
   ```

**No changes to `.tf` files are needed** — all configuration is driven by the `-var-file` parameter.

---

## Variables

### Root Variable: `kms_key_rings`

**Type:** `map(object({...}))`

**Default:** `{}`

**Description:** A map of KMS Key Ring instances to manage. Each key is a unique identifier, and each value defines the key ring's configuration.

**Structure:**
```hcl
kms_key_rings = {
  "<key_name>" = {
    name     = "<kms_key_ring_name>"
    location = "<gcp_location>"
    project  = "<gcp_project_id>"
  },
  ...
}
```

**Current Value (from `environments/sg.tfvars`):**
```hcl
kms_key_rings = {
  "arunim-gcp-bucket-2" = {
    name     = "arunim-gcp-bucket-2"
    location = "us"
    project  = "stackguardian-nonprod"
  }
}
```

**What Each Field Controls:**
- **Key** (`"arunim-gcp-bucket-2"`) — Used as the map key in `for_each`; determines the Terraform address prefix
- **`name`** — The name of the KMS Key Ring in GCP
- **`location`** — GCP region/location (e.g., "us", "us-east1", "europe-west1")
- **`project`** — GCP project ID where the key ring resides

---

## Outputs

### Root Output: `kms_key_ring_ids`

**Type:** `map(string)`

**Description:** Exports the IDs of all managed KMS Key Rings, keyed by their map identifier.

**Current Value:**
```hcl
{
  "arunim-gcp-bucket-2" = "projects/stackguardian-nonprod/locations/us/keyRings/arunim-gcp-bucket-2"
}
```

**Usage in Other Modules/Stacks:**
If other Terraform code needs to reference this key ring, output it via a data source or variable:
```hcl
# Reference in another stack
data "google_kms_key_ring" "example" {
  name     = "arunim-gcp-bucket-2"
  location = "us"
  project  = "stackguardian-nonprod"
}
```

---

## Infrastructure Graph

```
kms_key_ring (module invocation via for_each)
│
└── arunim-gcp-bucket-2 (map key)
    │
    └── google_kms_key_ring.this (resource)
        │
        └── [outputs]
            └── id (exported for reference)
```

**Dependency Flow:**
- Root variable `kms_key_rings` → controls module instantiation
- Module instance → creates `google_kms_key_ring` resource
- Resource attributes → available via module output `id`
- Root output → re-exports all key ring IDs for external use

**No external dependencies:** The KMS Key Ring is self-contained; no other resources reference it within this codebase.

---

## Notable Decisions & Caveats

### 1. **For-Each Pattern**
The module uses `for_each = var.kms_key_rings` to allow managing multiple key rings from a single module call. Currently, one key ring is configured, but the pattern scales to any number of key rings without code changes—only by editing `sg.tfvars`.

### 2. **No Crypto Keys Managed**
The discovered KMS Key Ring (`arunim-gcp-bucket-2`) has crypto keys associated with it (visible in the discovery metadata: `_reverse_kms_crypto_keys`), but these are **not managed by this code**. The code only manages the key ring itself. Crypto key management (creation, rotation, lifecycle) would require:
- Additional resource type: `google_kms_crypto_key`
- Additional module or root-level resources
- Explicit variable definitions for key rotation, deletion protection, etc.

**Implication:** If crypto keys are modified outside Terraform, the plan will show no drift for this code (as only the key ring itself is managed).

### 3. **Location: "us" (Global)**
The location `"us"` refers to a global, multi-region GCP location, not a specific region. Key rings in GCP are location-specific but not region-specific within a location. This is the standard pattern for KMS in GCP.

### 4. **Project Hard-Coded in Variables**
The GCP project ID is specified in the variable values (`environments/sg.tfvars`), not as a provider-level default. This allows the same code to manage key rings across multiple projects by editing `sg.tfvars`.

### 5. **No Authentication in Code**
GCP authentication is external to this code:
- The Terraform provider uses default credentials (service account, gcloud auth, or environment variables).
- No credentials, API keys, or auth tokens appear in `.tf` files or `sg.tfvars`.

### 6. **Computed Attributes Not Documented**
The Google provider automatically computes certain attributes (e.g., exact resource URIs, internal state). These are not included in the variable definitions but are available as computed outputs after `terraform apply`.

### 7. **Tags/Labels**
The discovered resource metadata shows empty tags (`"tags": "{}"`). The code does not currently support adding labels to the KMS Key Ring. To add labels, the module would need:
- A new variable: `labels = optional(map(string), {})`
- An updated resource: `labels = var.labels`

---

## File Structure

```
/mnt/sg_workspace/user/sgcode/
├── .sg/
│   └── DOCUMENTATION.md           (this file)
├── main.tf                        (root module; calls kms_key_ring module)
├── variables.tf                   (root-level input variables)
├── outputs.tf                     (root-level outputs)
├── versions.tf                    (required provider versions)
├── providers.tf                   (provider configuration)
├── imports.sh                     (import script for discovered resources)
├── environments/
│   └── sg.tfvars                  (environment-specific variables)
└── modules/
    └── kms_key_ring/
        ├── main.tf                (google_kms_key_ring resource)
        ├── variables.tf           (module input variables)
        └── outputs.tf             (module outputs)
```

---

## Summary

This minimal, well-organized Terraform codebase manages a single Google Cloud KMS Key Ring. The design emphasizes:
- **Simplicity:** One resource type, one module
- **Reusability:** For-each pattern supports multiple key rings
- **Environment Portability:** All values driven by `sg.tfvars`; no code edits for environment changes
- **Clean State:** All resources imported and reconciled; plan shows zero drift

To extend this code, add new variables to the module and root, or add new resource types (e.g., `google_kms_crypto_key`) alongside the existing `google_kms_key_ring`.
