# Terraform Infrastructure Documentation

## 1. Overview

This Terraform configuration manages Google Cloud Platform (GCP) service accounts for the StackGuardian non-production environment. The infrastructure code was generated from discovered cloud resources, imported into Terraform state, and reconciled until the plan showed 0/0/0 (no changes required), indicating that the configuration fully describes the current state of the cloud resources.

**Key Facts:**
- **IaC Tool:** Terraform/OpenTofu
- **Cloud Provider:** Google Cloud Platform (GCP)
- **Project:** `stackguardian-nonprod`
- **Reconciliation Status:** Complete — plan shows 0 to add, 0 to change, 0 to destroy
- **Resource Count:** 1 managed resource (1 service account)

## 2. Resources

| Terraform Address | Provider Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.service_account["infra2code_gcp"].google_service_account.this` | `google_service_account` | `infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com` | Service account for infrastructure-as-code automation (infra2code) in the non-production GCP project |

**Resource Details:**
- **Email:** `infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com`
- **Unique ID:** `111859689486593405351`
- **Display Name:** `infra2code-gcp`
- **Status:** Active (not disabled)
- **Description:** (empty)
- **Project:** `stackguardian-nonprod`

## 3. Module Structure

### Root Module (`/`)

The root module (`main.tf`, `variables.tf`, `outputs.tf`, `providers.tf`, `versions.tf`) provides the top-level configuration:

- **Provider Configuration:** Google Cloud Platform provider parameterized by `var.project_id`
- **Module Declaration:** Calls `module.service_account` as a `for_each` loop over `var.service_accounts`
- **Variables:**
  - `project_id` (required string): GCP project ID to manage
  - `service_accounts` (optional map): Map of service account configurations; defaults to empty map
- **Outputs:** None at root level

### Module: `modules/service_account/`

This local module encapsulates the creation and management of a single Google service account.

**Files:**
- `main.tf` — Defines `google_service_account.this` resource
- `variables.tf` — Input parameters: `account_id` (required), `display_name`, `description`, `disabled`, `project`
- `outputs.tf` — Exports: `email`, `name`, `unique_id`

**Purpose:** Abstracts service account lifecycle management, enabling reusable configuration via `for_each` loops in the root module.

**Module Calls:**
- Called from root as: `module.service_account` with `for_each = var.service_accounts`
- Current instantiation key: `"infra2code_gcp"`
- Passes: `account_id`, `display_name`, `description`, `disabled`, `project` from the map entry

## 4. How Import Works

The `imports.sh` script was used once during the initial setup to import the existing cloud resource into Terraform state. The script contains:

```bash
"$1" import -var-file environments/sg.tfvars 'module.service_account["infra2code_gcp"].google_service_account.this' 'projects/stackguardian-nonprod/serviceAccounts/infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com'
```

**How It Works:**
1. `$1` is the Terraform/OpenTofu binary path passed as the first argument
2. The `import` command maps the existing cloud resource (identified by its GCP resource path) to the Terraform state address
3. The `-var-file environments/sg.tfvars` flag provides the necessary variables (project ID and service account configuration)
4. The state entry is now managed by `module.service_account["infra2code_gcp"].google_service_account.this`

**Re-importing a Single Resource:**

If state is lost or corrupted, re-import the service account with:

```bash
terraform init -var-file=environments/sg.tfvars
terraform import -var-file=environments/sg.tfvars \
  'module.service_account["infra2code_gcp"].google_service_account.this' \
  'projects/stackguardian-nonprod/serviceAccounts/infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com'
```

**Note:** The import script need not be re-run; it is a historical record of the initial import operation.

## 5. How to Use the Code

### Prerequisites
- Terraform or OpenTofu installed (version as specified in `versions.tf`)
- Google Cloud SDK authentication configured (e.g., `gcloud auth application-default login`)
- Working directory: `/mnt/sg_workspace/user/global-settings`

### Basic Workflow

#### Initialize Terraform
```bash
terraform init -var-file=environments/sg.tfvars
```

#### Plan Changes
```bash
terraform plan -var-file=environments/sg.tfvars
```

#### Apply Changes
```bash
terraform apply -var-file=environments/sg.tfvars
```

### Targeting Another Environment

To manage a different GCP project (e.g., development, production):

1. **Create a new environment file** (e.g., `environments/dev.tfvars`):
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** with different values:
   ```hcl
   project_id = "stackguardian-dev"
   
   service_accounts = {
     "infra2code_gcp" = {
       account_id   = "infra2code-gcp"
       display_name = "infra2code-gcp"
       description  = ""
       disabled     = false
       project      = "stackguardian-dev"
     }
   }
   ```

3. **Plan and apply** with the new environment file:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**Important:** No `.tf` file changes are required — all environment-specific configuration lives in `.tfvars` files.

### Adding New Service Accounts

To add another service account, edit `environments/sg.tfvars` and add an entry to the `service_accounts` map:

```hcl
service_accounts = {
  "infra2code_gcp" = {
    account_id   = "infra2code-gcp"
    display_name = "infra2code-gcp"
    description  = ""
    disabled     = false
    project      = "stackguardian-nonprod"
  }
  "new_account" = {
    account_id   = "new-service-account"
    display_name = "new-service-account"
    description  = "New service account for a different purpose"
    disabled     = false
    project      = "stackguardian-nonprod"
  }
}
```

Then run `terraform plan` and `terraform apply`.

## 6. Variables

### `project_id` (required)
- **Type:** `string`
- **Description:** The GCP project ID in which to manage resources
- **Example:** `"stackguardian-nonprod"`
- **Source:** `environments/sg.tfvars`

### `service_accounts` (optional)
- **Type:** `map(object({ ... }))`
- **Description:** Map of service accounts to create and manage
- **Default:** `{}` (empty map)
- **Attributes per entry:**
  - `account_id` (required): Unique identifier for the service account (becomes part of the email)
  - `display_name` (optional): Human-readable name; defaults to `""`
  - `description` (optional): Service account description; defaults to `""`
  - `disabled` (optional): Whether the service account is disabled; defaults to `false`
  - `project` (optional): Override project ID for this specific account; defaults to `""`
- **Source:** `environments/sg.tfvars`

**Example:**
```hcl
service_accounts = {
  "infra2code_gcp" = {
    account_id   = "infra2code-gcp"
    display_name = "infra2code-gcp"
    description  = ""
    disabled     = false
    project      = "stackguardian-nonprod"
  }
}
```

### Sensitive Variables

**None** — This stack contains no sensitive inputs (credentials, tokens, API keys, etc.). All configuration is non-sensitive and stored in `.tfvars` files.

If API keys or other credentials become necessary in future iterations, they should be passed via:
- A `secrets.auto.tfvars` file (not included in version control), or
- Command-line `-var` flags, or
- Environment variables (prefixed with `TF_VAR_`)

Example (if needed):
```bash
terraform apply -var="api_key=xxx" -var-file=environments/sg.tfvars
```

## 7. Infrastructure Graph

```
module.service_account["infra2code_gcp"]
└── google_service_account.this
    ├─ Identifier: infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com
    ├─ Project: stackguardian-nonprod
    ├─ Email: infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com
    └─ Unique ID: 111859689486593405351
```

**Dependencies:**
- Root module variable `var.project_id` → Google Cloud provider
- Root module `for_each` iteration over `var.service_accounts` → Module instantiation
- Module inputs (`account_id`, `display_name`, etc.) → Service account resource

**Reverse References (from discovered data):**
- `google_service_account_key` (5 keys associated with this service account):
  - `2a9d05b6dff907f7b3e64c76b2b89d344d6bc567`
  - `a60a63b18c160ddbbb7d2258e28198ff1d845ad7`
  - `b18f342da2208e87d854e3d57cfb06b20bfda5ca`
  - `c3956df232e1a344855f3ab0853f14a4e235bdc7`
  - `e9cc6ee4f618d194efc764f7cc8dde6271d51e91`

(These keys are not currently managed by this Terraform configuration; they are credentials that exist in the cloud but are not in state.)

## 8. Notable Decisions & Caveats

### No `lifecycle { ignore_changes }`

Per the handoff summary, no `lifecycle` blocks were added to the `google_service_account` resource because all attributes are stable and sourced from discovery. The service account configuration is static and does not require drift detection or drift correction.

### Computed Attributes Omitted

The module outputs only three computed attributes for convenience:
- `email`: Service account email address
- `name`: Fully-qualified resource name
- `unique_id`: GCP-generated unique identifier

Other computed read-only attributes (e.g., `create_time`, `disabled_date`) are available in state but not exposed as module outputs; they can be accessed directly from the resource state if needed.

### Service Account Keys Not Managed

Five service account keys are associated with the service account resource but are **not** managed by this Terraform configuration:
- They exist in the cloud (discovered during resource scanning)
- They are not imported into state
- They should be managed separately (via a different module, manual rotation, or external key management service) if lifecycle control is desired

If key rotation or key management becomes necessary, a `google_service_account_key` resource or data source can be added to this configuration.

### No Service Account IAM Bindings

This configuration does **not** manage IAM bindings (role assignments) for the service account. The service account is created but has no roles or permissions assigned. To grant permissions:
- Add `google_project_iam_binding` or `google_project_iam_member` resources, or
- Use a separate configuration module focused on IAM policy management

This separation is intentional: service account creation and IAM bindings are often managed by different teams or contexts in enterprise environments.

### Environment-Driven Configuration

All infrastructure variation is driven by `.tfvars` files (`environments/sg.tfvars`, etc.). No `.tf` code modification is required to deploy to different environments or add resources. This allows for:
- Reproducible deployments across dev/staging/production
- Version control of infrastructure code without environment-specific secrets
- Consistent module behavior across all deployments

### Plan Reconciliation

The initial resource discovery yielded one service account (`infra2code-gcp@stackguardian-nonprod.iam.gserviceaccount.com`). It was imported into state via `imports.sh`, and the resulting Terraform plan showed **0/0/0** (no changes), confirming that:
1. All discovered resources are now represented in the configuration
2. No drift exists between the configuration and the cloud state
3. No additional resources are needed to reach the target state
