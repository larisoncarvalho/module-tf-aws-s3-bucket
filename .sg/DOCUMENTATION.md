# Terraform Documentation: Global Settings

## 1. Overview

This Terraform configuration manages a small set of AWS resources in the `ap-southeast-1` region. The infrastructure was generated from discovered cloud resources and reconciled through import statements until the plan showed no changes (0 to add, 0 to change, 0 to destroy), indicating that the state matches the actual cloud resources.

**What was done:**
- Discovered two AWS resources: a CloudFormation stack (`stulyze-app`) and an Athena workgroup (`primary`)
- Generated Terraform code to represent these resources using modular architecture
- Imported both resources into state via `imports.sh`
- Reconciled configuration until plan showed clean state (no drift)

The configuration uses two local modules:
- `modules/cloudformation_stack/` — manages CloudFormation stacks
- `modules/athena_workgroup/` — manages Athena workgroups

Both modules are instantiated via `for_each` loops from root variables, allowing multiple instances of each resource type to be managed simultaneously.

---

## 2. Resources

| Terraform Address | Provider | Real-world Name/ID | Purpose |
|---|---|---|---|
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | `aws` | `stulyze-app` (ARN: `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518`) | CloudFormation stack deployed in ap-southeast-1; contains a DynamoDB table resource named `stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG` |
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | `aws` | `primary` | Athena workgroup with CloudWatch metrics publishing enabled; serves as the primary query execution environment |

---

## 3. Module Structure

### Root Module

**Location:** `/mnt/sg_workspace/user/global-settings/`

**Files:**
- `main.tf` — instantiates two `for_each`-based modules: `cloudformation_stack` and `athena_workgroup`
- `variables.tf` — defines `cloudformation_stacks` and `athena_workgroups` map variables
- `versions.tf` — declares required AWS provider
- `providers.tf` — configures AWS provider for `ap-southeast-1`
- `outputs.tf` — (empty; per-instance outputs are omitted to avoid stale-null issues)

### Module: cloudformation_stack

**Location:** `modules/cloudformation_stack/`

**Purpose:** Wraps `aws_cloudformation_stack` resource with configurable stack properties and lifecycle management.

**Files:**
- `main.tf` — defines `aws_cloudformation_stack.this` resource
  - Accepts: name, disable_rollback, notification_arns, tags
  - **Lifecycle rule:** ignores `template_body`, `template_url`, `parameters`, `capabilities`, `on_failure` (write-only attributes not returned by API post-creation)
- `variables.tf` — defines input variables
- `outputs.tf` — exports `id` (stack ARN) and `outputs` (CloudFormation stack outputs map)

### Module: athena_workgroup

**Location:** `modules/athena_workgroup/`

**Purpose:** Wraps `aws_athena_workgroup` resource with configuration block, engine version selection, and optional result/encryption settings.

**Files:**
- `main.tf` — defines `aws_athena_workgroup.this` resource
  - Accepts: name, description, state, tags
  - Configuration block: enforce_workgroup_configuration, publish_cloudwatch_metrics_enabled, requester_pays_enabled, bytes_scanned_cutoff_per_query
  - Engine version: selected_engine_version
  - Result configuration (optional): output_location, encryption_option, kms_key (dynamically created if output_location or encryption_option is set)
- `variables.tf` — defines input variables with sensible defaults
- `outputs.tf` — exports `id` (workgroup name) and `arn` (workgroup ARN)

**No external modules:** Both modules are local (source = "./modules/..."). The stack uses no git:: external modules.

---

## 4. How Import Works

All resources have already been imported into state via `imports.sh`. The import script contains two commands:

```bash
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

**Why:**
- The CloudFormation stack is identified by its full ARN (region, account, stack name, and unique ID)
- The Athena workgroup is identified by its name (`primary`)

**Re-importing a single resource (if state is lost):**
```bash
# For the CloudFormation stack:
terraform import -var-file environments/sg.tfvars \
  'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' \
  'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'

# For the Athena workgroup:
terraform import -var-file environments/sg.tfvars \
  'module.athena_workgroup["primary"].aws_athena_workgroup.this' \
  'primary'
```

The `-var-file environments/sg.tfvars` flag ensures the variables (cloudformation_stacks, athena_workgroups) are loaded during import, matching the module instances.

---

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

This downloads provider plugins and sets up the working directory.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows what changes will be made. Expected output (in current state): 0 to add, 0 to change, 0 to destroy.

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

This creates/updates resources according to the plan. (No changes expected in current state.)

### Target Another Environment

To manage resources in a different environment (e.g., `dev`, `prod`):

1. **Copy the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file to change values:**
   ```bash
   # Edit environments/dev.tfvars
   # Change cloudformation_stacks and athena_workgroups as needed
   ```

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

**Important:** Do NOT edit any `.tf` files to change environment-specific settings. All configuration should come from the `-var-file=` argument.

---

## 6. Variables

### Root Variables

#### `cloudformation_stacks`
- **Type:** `map(object({...}))`
- **Description:** Map of CloudFormation stacks to manage
- **Schema:**
  - `name` (string, required) — Name of the CloudFormation stack
  - `disable_rollback` (bool, optional, default: `false`) — Disable rollback on stack creation failure
  - `notification_arns` (list(string), optional, default: `[]`) — SNS topic ARNs for stack notifications
  - `tags` (map(string), optional, default: `{}`) — Tags to apply to the stack
- **Example value** (in `environments/sg.tfvars`):
  ```hcl
  cloudformation_stacks = {
    stulyze_app = {
      name              = "stulyze-app"
      disable_rollback  = false
      notification_arns = []
    }
  }
  ```

#### `athena_workgroups`
- **Type:** `map(object({...}))`
- **Description:** Map of Athena workgroups to manage
- **Schema:**
  - `name` (string, required) — Name of the Athena workgroup
  - `description` (string, optional, default: `""`) — Description of the workgroup
  - `state` (string, optional, default: `"ENABLED"`) — State of the workgroup (ENABLED or DISABLED)
  - `enforce_workgroup_configuration` (bool, optional, default: `true`) — Whether to enforce workgroup configuration
  - `publish_cloudwatch_metrics_enabled` (bool, optional, default: `true`) — Whether to publish CloudWatch metrics
  - `requester_pays_enabled` (bool, optional, default: `false`) — Whether requester pays for cross-account queries
  - `selected_engine_version` (string, optional, default: `"AUTO"`) — Engine version requested by user
  - `bytes_scanned_cutoff_per_query` (number, optional, default: `null`) — Upper data usage limit per query in bytes
  - `output_location` (string, optional, default: `null`) — S3 bucket URL for query results
  - `encryption_option` (string, optional, default: `null`) — Encryption option (SSE-S3, SSE-KMS, CSE-KMS)
  - `kms_key` (string, optional, default: `null`) — KMS key ARN for SSE-KMS or CSE-KMS
  - `tags` (map(string), optional, default: `{}`) — Tags to apply to the workgroup
- **Example value** (in `environments/sg.tfvars`):
  ```hcl
  athena_workgroups = {
    primary = {
      name                               = "primary"
      description                        = ""
      state                              = "ENABLED"
      enforce_workgroup_configuration    = false
      publish_cloudwatch_metrics_enabled = true
      requester_pays_enabled             = false
      selected_engine_version            = "AUTO"
    }
  }
  ```

### Sensitive Variables

**No sensitive variables are defined in this configuration.** The handoff notes confirm that no credential-like values were found in the discovered resources, and `secrets.auto.tfvars` was not created. All variable values are provided via `environments/sg.tfvars`.

---

## 7. Infrastructure Graph

```
module.cloudformation_stack["stulyze_app"]
└── aws_cloudformation_stack.this
    └── (physical resource: DynamoDB table "stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG")

module.athena_workgroup["primary"]
└── aws_athena_workgroup.this
    └── (configuration: metrics publishing, engine version AUTO, no encryption)
```

**Dependencies:** No explicit dependencies between the two modules; both are independent root-level module calls.

---

## 8. Notable Decisions & Caveats

### Lifecycle: Ignored Changes on CloudFormation Stack

**Resource:** `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this`

**Lifecycle rule:**
```hcl
lifecycle {
  ignore_changes = [
    template_body,
    template_url,
    parameters,
    capabilities,
    on_failure,
  ]
}
```

**Reason:** These are write-only attributes in the AWS CloudFormation API. After stack creation, the API does not return the template body, template URL, parameters, or capabilities. If Terraform attempted to manage these post-creation, it would detect perpetual drift and trigger unwanted updates on every plan. Ignoring these changes allows the resource to remain stable once imported.

**Impact:** Changes to the CloudFormation template, parameters, or capabilities must be made outside of Terraform (via AWS CloudFormation directly), or the resource must be destroyed and recreated if the template needs to be updated.

### Provider Schema Fixes Applied

**Issue 1:** `aws_cloudformation_stack` — The `enable_termination_protection` argument was discovered in cloud attributes but is not accepted by Terraform AWS provider v6+. It has been omitted from the configuration.

**Issue 2:** `aws_athena_workgroup.configuration` — The `bytes_scanned_cutoff_per_query` is a plain attribute (not a nested block argument). The configuration correctly defines it as a top-level argument within the configuration block.

**Issue 3:** KMS key argument — The correct argument name in the encryption configuration block is `kms_key_arn` (not `kms_key`), and the module variable is named `kms_key` to match the provider schema.

### Omitted Computed Attributes

The following attributes are computed by AWS and not managed via Terraform:
- CloudFormation stack: `creation_time`, `last_updated_time`, `status`, `stack_drift_status`, `outputs` (read from cloud, not written)
- Athena workgroup: `creation_time`, `arn` (read from cloud, not written)

These are exposed via module outputs (`outputs.id`, `outputs.arn`) for reference but are not configurable.

### No Remaining Drift

As of the final reconciliation:
- The state matches the cloud resources exactly
- Plan output: **0 to add, 0 to change, 0 to destroy**
- No manual remediation is required
