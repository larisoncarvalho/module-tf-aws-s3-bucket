# Terraform Documentation — Global Settings

## 1. Overview

This Terraform configuration manages AWS global settings and analysis infrastructure in the **ap-southeast-1** (Singapore) region. The code was generated from discovered cloud resources, imported into state using `imports.sh`, and reconciled until the plan showed no changes (0 to add, 0 to change, 0 to destroy).

The infrastructure consists of:
- **1 CloudFormation stack** (`stulyze-app`) — a pre-existing stack containing DynamoDB resources.
- **1 Athena workgroup** (`primary`) — a query execution workgroup with custom configuration settings.

Both resources are managed through Terraform modules using `for_each` to allow flexible mapping of multiple instances from variable objects.

---

## 2. Resources

| Terraform Address | Provider | Real-World Name / ID | Purpose |
|---|---|---|---|
| `module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this` | aws | `stulyze-app` (ARN: `arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518`) | CloudFormation stack wrapping DynamoDB table `stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG` |
| `module.athena_workgroup["primary"].aws_athena_workgroup.this` | aws | `primary` | Athena workgroup for SQL query execution in ap-southeast-1; references the AWS account's pre-existing primary workgroup |

---

## 3. Module Structure

### Root Module (`./`)
- **File:** `main.tf`, `variables.tf`, `providers.tf`, `versions.tf`, `outputs.tf`
- **Role:** Entry point that calls two child modules using `for_each`.
- **Variables:**
  - `cloudformation_stacks` (map(object)) — key-value map of CloudFormation stacks to manage.
  - `athena_workgroups` (map(object)) — key-value map of Athena workgroups to manage.
- **Provider:** AWS, region `ap-southeast-1`.

### Module: `cloudformation_stack` (`modules/cloudformation_stack/`)
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Resource:** `aws_cloudformation_stack` (singleton per for_each key)
- **Inputs:**
  - `name` (string, required) — stack name.
  - `disable_rollback` (bool, default: `false`) — whether to disable rollback on failure.
  - `notification_arns` (list(string), default: `[]`) — SNS topic ARNs for notifications.
  - `tags` (map(string), default: `{}`) — resource tags.
- **Outputs:**
  - `id` — stack ARN.
  - `outputs` — CloudFormation stack outputs (e.g., `StulyzeResourceTableName`).
- **Note:** The `enable_termination_protection` attribute is not supported in AWS provider v6.x for `aws_cloudformation_stack` and was omitted from the generated code.

### Module: `athena_workgroup` (`modules/athena_workgroup/`)
- **Files:** `main.tf`, `variables.tf`, `outputs.tf`
- **Resource:** `aws_athena_workgroup` (singleton per for_each key)
- **Inputs:**
  - `name` (string, required) — workgroup name.
  - `description` (string, default: `""`) — workgroup description.
  - `enforce_workgroup_configuration` (bool, default: `true`) — whether to enforce workgroup settings.
  - `publish_cloudwatch_metrics_enabled` (bool, default: `true`) — CloudWatch metrics publication.
  - `requester_pays_enabled` (bool, default: `false`) — whether requester pays is enabled.
  - `tags` (map(string), default: `{}`) — resource tags.
- **Outputs:**
  - `id` — workgroup name.
  - `arn` — workgroup ARN.
- **Note:** State is always set to `"ENABLED"` (hardcoded in the module).

---

## 4. How Import Works

### Initial Import (Already Completed)

The `imports.sh` script contains two import commands that map Terraform addresses to cloud resource IDs:

```bash
"$1" import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
"$1" import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

These commands populate Terraform state with the discovered resources. **This has already been run once and does not need to be re-run.**

### Re-Importing a Single Resource

If state is lost for a specific resource, re-import it with the command shown above, substituting `$1` with the path to the Terraform binary:

```bash
terraform import -var-file environments/sg.tfvars 'module.cloudformation_stack["stulyze_app"].aws_cloudformation_stack.this' 'arn:aws:cloudformation:ap-southeast-1:714114208215:stack/stulyze-app/0fc6fa90-2d31-11ee-94b5-062fa483a518'
```

Or for the Athena workgroup:

```bash
terraform import -var-file environments/sg.tfvars 'module.athena_workgroup["primary"].aws_athena_workgroup.this' 'primary'
```

**Key points:**
- The `-var-file environments/sg.tfvars` is required to provide the module for_each keys at import time.
- For CloudFormation stacks, the import ID is the full stack ARN.
- For Athena workgroups, the import ID is the workgroup name.

---

## 5. How to Use the Code

### Initialize the Working Directory

```bash
terraform init
```

This downloads the AWS provider and sets up the local state backend.

### Plan Changes

To preview changes with the default environment variables (`environments/sg.tfvars`):

```bash
terraform plan -var-file=environments/sg.tfvars
```

Expected output: **No changes** (plan is already reconciled with cloud state).

### Apply Changes

To apply planned changes:

```bash
terraform apply -var-file=environments/sg.tfvars
```

Since the plan shows no changes, this is a no-op after the initial import.

### Targeting Another Environment

To manage a different environment (e.g., `dev` or `prod`):

1. **Copy the variables file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** with environment-specific values:
   ```bash
   # Example: environments/dev.tfvars
   cloudformation_stacks = {
     stulyze_app = {
       name              = "stulyze-app-dev"
       disable_rollback  = true
       notification_arns = []
     }
   }
   
   athena_workgroups = {
     primary = {
       name                               = "primary-dev"
       description                        = "Dev environment"
       enforce_workgroup_configuration    = false
       publish_cloudwatch_metrics_enabled = true
       requester_pays_enabled             = false
     }
   }
   ```

3. **Plan and apply with the new file** — no `.tf` edits required:
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   terraform apply -var-file=environments/dev.tfvars
   ```

---

## 6. Variables

### `cloudformation_stacks` (map(object))
- **Type:** `map(object({name, disable_rollback, notification_arns, tags}))`
- **Default:** `{}`
- **Controls:** CloudFormation stacks to create or update.
- **Values supplied in:** `environments/sg.tfvars`
  ```hcl
  cloudformation_stacks = {
    stulyze_app = {
      name              = "stulyze-app"
      disable_rollback  = false
      notification_arns = []
    }
  }
  ```

### `athena_workgroups` (map(object))
- **Type:** `map(object({name, description, enforce_workgroup_configuration, publish_cloudwatch_metrics_enabled, requester_pays_enabled, tags}))`
- **Default:** `{}`
- **Controls:** Athena workgroups to create or update.
- **Values supplied in:** `environments/sg.tfvars`
  ```hcl
  athena_workgroups = {
    primary = {
      name                               = "primary"
      description                        = ""
      enforce_workgroup_configuration    = false
      publish_cloudwatch_metrics_enabled = true
      requester_pays_enabled             = false
    }
  }
  ```

### Sensitive Variables / Secrets

**None required.** This stack contains no credential-like or sensitive values. No `secrets.auto.tfvars` file exists or is needed.

---

## 7. Infrastructure Graph

```
Root Module (./main.tf)
├── module.cloudformation_stack["stulyze_app"]
│   └── aws_cloudformation_stack.this
│       └── (Cloud resource: CloudFormation stack "stulyze-app")
│           └── AWS::DynamoDB::Table (stulyze-app-StulyzeResourceTable-N5SV2SEDRNMG)
│
└── module.athena_workgroup["primary"]
    └── aws_athena_workgroup.this
        └── (Cloud resource: Athena workgroup "primary")
```

**Dependencies:** None between modules; both are independent and can be managed separately.

---

## 8. Notable Decisions & Caveats

### CloudFormation Stack Module

- **`enable_termination_protection` omitted:** This attribute is not valid in the AWS provider v6.x for `aws_cloudformation_stack`. The discovered resource has this setting on the cloud side, but Terraform cannot model it directly; it must be managed through the AWS Console or CloudFormation API if needed.
- **Stack outputs are read-only:** The `outputs` output exposes CloudFormation stack outputs (e.g., `StulyzeResourceTableName`), which are computed from the nested resources within the stack.
- **No state-level deletion:** CloudFormation stacks are `managed` resources in Terraform state. Removing the key from `cloudformation_stacks` and applying will **delete** the stack from AWS.

### Athena Workgroup Module

- **`enforce_workgroup_configuration` explicitly set to `false`:** The discovered `primary` workgroup has this setting disabled (non-default behavior). The configuration explicitly models this so that the plan remains reconciled. Changing this value in the tfvars will enforce or relax workgroup-level configuration restrictions.
- **State always `"ENABLED"`:** The module hardcodes `state = "ENABLED"` and does not expose it as a variable. To disable a workgroup, the state must be changed manually outside Terraform or the module must be modified.
- **No lifecycle rules:** No `ignore_changes` blocks are needed because no computed-only or ephemeral attributes are present.

### Reconciliation Status

- **Plan is clean:** No resources differ between the Terraform code and the cloud state.
- **No drift:** Both resources were imported and are correctly modeled.
- **No placeholders:** All discovered attributes are represented in the code; no TODO or stub values remain.

---

**Generated:** 2026-06-24 | **Region:** ap-southeast-1 | **Account:** 714114208215
