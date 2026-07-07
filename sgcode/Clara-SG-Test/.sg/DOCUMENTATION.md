# Infrastructure Documentation: global-settings

## 1. Overview

This Terraform configuration manages Google Cloud Platform (GCP) service accounts in the `stackguardian-nonprod` project. The infrastructure was generated from discovered cloud resources and has been fully reconciled — all resources have been imported into state and the configuration achieves zero drift (plan shows 0/0/0).

### What Was Done
- **Code Generation**: Terraform configuration was generated from discovered GCP IAM resources
- **Import**: The discovered `google_service_account` resource was imported into Terraform state using the `imports.sh` script
- **Reconciliation**: Configuration was adjusted until `terraform plan` showed no changes (0 to add, 0 to change, 0 to destroy)

## 2. Resources

| Terraform Address | Provider | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.service_account["clara_sg_test"].google_service_account.this` | `google` | `clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com` | Service account for Clara integration in StackGuardian non-production environment |

**Resource Details:**
- **Project**: `stackguardian-nonprod`
- **Email**: `clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com`
- **Unique ID**: `115321568690603961157`
- **Status**: Active (not disabled)
- **Description**: (empty)

## 3. Module Structure

### Root Module (`/`)
The root module is minimal and acts as an orchestrator:
- **File**: `main.tf` — Calls the `service_account` module via `for_each` over `var.service_accounts`
- **File**: `providers.tf` — Configures the Google Cloud provider with project ID
- **File**: `variables.tf` — Defines root input variables
- **File**: `outputs.tf` — No root-level outputs (intentionally empty to avoid stale-null issues with `for_each`)
- **File**: `versions.tf` — Specifies required providers (HashiCorp Google provider)

### Module: `modules/service_account/`
**Purpose**: Encapsulates the creation and configuration of a single Google Cloud service account.

**Call Style**: Root module calls this module via `for_each` over `var.service_accounts`, using the map key (`clara_sg_test`) as the iteration key.

**Files**:
- **`main.tf`** — Defines a single `google_service_account` resource named `this`
  - Arguments: `account_id`, `display_name`, `description`, `disabled`
  
- **`variables.tf`** — Defines four input variables:
  - `account_id` (required): The service account ID
  - `display_name` (optional, default `""`): Human-readable name
  - `description` (optional, default `""`): Service account description
  - `disabled` (optional, default `false`): Whether the account is disabled
  
- **`outputs.tf`** — Exports two outputs:
  - `email`: The service account's email address (e.g., `clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com`)
  - `name`: The fully-qualified resource name (e.g., `projects/stackguardian-nonprod/serviceAccounts/clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com`)

## 4. How Import Works

The `imports.sh` script contained a single import command:

```bash
terraform import -var-file environments/sg.tfvars 'module.service_account["clara_sg_test"].google_service_account.this' 'projects/stackguardian-nonprod/serviceAccounts/clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com'
```

**Process**:
1. The script was executed once to populate Terraform state from the discovered live resource
2. No re-import is necessary unless state is lost or deleted
3. The import ID format is the GCP fully-qualified service account resource path: `projects/{project_id}/serviceAccounts/{email}`

**To Re-import a Single Resource** (if state is lost):
```bash
terraform import -var-file=environments/sg.tfvars 'module.service_account["clara_sg_test"].google_service_account.this' 'projects/stackguardian-nonprod/serviceAccounts/clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com'
```

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

This downloads the Google Cloud provider and initializes the working directory.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows what changes Terraform would make. In the current state, this should output "0 to add, 0 to change, 0 to destroy" since the configuration is reconciled.

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

This applies any planned changes (creates/updates/deletes resources). Currently, no changes are needed.

### Targeting Another Environment

To manage a different GCP project or environment:

1. **Copy the existing environment file**:
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new environment file** with values for the target environment:
   ```bash
   # environments/dev.tfvars
   project_id = "my-dev-project"
   service_accounts = {
     "my_service_account" = {
       account_id   = "my-account"
       display_name = "My Service Account"
       description  = "Description for dev"
       disabled     = false
     }
   }
   ```

3. **Plan and apply with the new file**:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**Important**: No `.tf` files need to be edited. All environment-specific configuration lives in `.tfvars` files.

## 6. Variables

### Root Variables

#### `project_id`
- **Type**: `string`
- **Required**: Yes
- **Current Value**: `stackguardian-nonprod` (in `environments/sg.tfvars`)
- **Description**: The GCP project ID where resources will be created
- **Purpose**: Configures the Google Cloud provider to target the correct project

#### `service_accounts`
- **Type**: `map(object({...}))`
- **Required**: No (defaults to empty map `{}`)
- **Current Value**: Map with one key `clara_sg_test` (in `environments/sg.tfvars`)
- **Description**: Map of service accounts to manage
- **Schema**:
  - `account_id` (required string): The service account ID
  - `display_name` (optional string, default `""`): Human-readable display name
  - `description` (optional string, default `""`): Service account description
  - `disabled` (optional bool, default `false`): Whether the account is disabled

**Current Configuration** (from `environments/sg.tfvars`):
```hcl
service_accounts = {
  "clara_sg_test" = {
    account_id   = "clara-sg-test"
    display_name = "Clara-sg-test"
    description  = ""
    disabled     = false
  }
}
```

### Sensitive Variables

**None** — All variables have values specified in the `.tfvars` files. No `secrets.auto.tfvars` is required for this configuration.

## 7. Infrastructure Graph

```
Root Module (project_id = "stackguardian-nonprod")
│
└── module.service_account["clara_sg_test"]
    │
    └── google_service_account.this
        ├── email: clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com
        └── name: projects/stackguardian-nonprod/serviceAccounts/clara-sg-test@stackguardian-nonprod.iam.gserviceaccount.com
```

**Dependencies**:
- The `service_account` module depends on `var.service_accounts` (via `for_each`)
- The `google_service_account` resource depends on the Google provider (which requires `var.project_id`)

**Related Resources (Not Managed)**:
- Three `google_service_account_key` resources exist in the cloud for the service account (`54f6a8d40a4f69441fd4107ee732129711ad8859`, `8f772756f5cb746f0f86ab91e8f7b5f469322434`, `967d378bf821c185258e216009afe2a1aedd6f90`)
- These keys are referenced in discovery data but are **not managed** by this Terraform configuration (see Notable Decisions below)

## 8. Notable Decisions & Caveats

### Service Account Keys Not Managed

The three service account keys referenced in the discovery data (`google_service_account_key` resources) are **deliberately not managed** by this configuration. Reasons:
- Keys were not included in the discovered resources input (closed-world assumption: if a resource isn't in discovery, it shouldn't be managed)
- Service account key lifecycle is typically managed separately, often by integrations or external tooling
- Keys are sensitive and should be rotated independently of the service account itself

### Empty Description

The `description` field is set to an empty string (`""`), matching the discovered cloud state. This is explicitly configured and is valid — the Google provider accepts empty descriptions.

### No `lifecycle { ignore_changes }` Blocks

No resources have `lifecycle` blocks because the generated configuration matches the live state exactly and there are no computed attributes that drift independently.

### No Sensitive Values

All variable values are non-sensitive and are included in the `.tfvars` files. The configuration contains:
- Project ID (non-secret)
- Service account names and metadata (non-secret)
- No API keys, tokens, or credentials

### Zero Drift at Reconciliation

The configuration has been tested and verified to have zero drift:
```
No changes. Infrastructure matches configuration (0 to add, 0 to change, 0 to destroy)
```

This means the code can be safely used as a single source of truth for these resources going forward.

### Google Provider Auto-Configuration

The `providers.tf` was populated with a `google` provider block that uses `var.project_id`. This allows the provider to be configured entirely via variable files, making it easy to target different projects without code changes.
