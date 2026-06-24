# Infrastructure Documentation — global-settings

## 1. Overview

This Terraform configuration manages AWS IAM roles discovered from a non-prod environment. The infrastructure code was generated from discovered cloud resources and imported into Terraform state using `terraform import` commands recorded in `imports.sh`. The configuration has been reconciled until the plan showed 0/0/0 (zero resources to add, change, or destroy), confirming that the infrastructure matches the configuration.

**Current state:** All discovered resources are now managed by Terraform. No unmanaged drift remains.

---

## 2. Resources

| Terraform Address | Provider Type | Real-World Name/ID | Purpose |
|---|---|---|---|
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this` | `aws_iam_role` | `non-prod-adis-us-west-2-admin-task-execution-role` | ECS task execution role for non-prod ADIS environment; allows ECS tasks and the AWS account root to assume the role. |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]` | `aws_iam_role_policy_attachment` | AmazonECSTaskExecutionRolePolicy | AWS managed policy attachment for ECS task execution permissions. |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]` | `aws_iam_role_policy_attachment` | AmazonElasticFileSystemFullAccess | AWS managed policy attachment for full EFS access. |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]` | `aws_iam_role_policy_attachment` | AmazonS3ReadOnlyAccess | AWS managed policy attachment for read-only S3 access. |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]` | `aws_iam_role_policy_attachment` | AmazonElasticFileSystemClientReadWriteAccess | AWS managed policy attachment for EFS client read/write access. |

---

## 3. Module Structure

### Root Module (`.`)

**Location:** `/mnt/sg_workspace/user/global-settings/`

**Contents:**
- `main.tf` — declares the `iam_role` module with a `for_each` loop iterating over `var.iam_roles`, passing each instance's configuration (name, path, description, max_session_duration, assume_role_policy, attached_policy_arns, tags).
- `variables.tf` — defines `var.iam_roles` as a map of objects, with each key being a stable snake_case identifier and values containing role configuration.
- `versions.tf` — specifies required providers (`hashicorp/aws`).
- `providers.tf` — configures the AWS provider with region `us-east-1`.
- `outputs.tf` — placeholder (no direct outputs; module outputs are accessed individually downstream).

### Module: `modules/iam_role`

**Location:** `/mnt/sg_workspace/user/global-settings/modules/iam_role/`

**Purpose:** Reusable module that manages a single AWS IAM role and its attached managed policies.

**Resources:**
- `aws_iam_role.this` — creates the IAM role with assume role trust policy.
- `aws_iam_role_policy_attachment.this` (for_each) — attaches each managed policy ARN to the role.

**Module Variables:**
- `name` (string, required) — the IAM role name.
- `path` (string, optional, default = "/") — IAM path for the role.
- `description` (string, optional, default = null) — role description.
- `max_session_duration` (number, optional, default = 3600) — maximum session duration in seconds.
- `assume_role_policy` (string, required) — JSON-encoded trust policy document.
- `attached_policy_arns` (list(string), optional, default = []) — list of AWS managed policy ARNs to attach.
- `tags` (map(string), optional, default = {}) — resource tags.

**Module Outputs:**
- `name` — name of the created IAM role.
- `arn` — ARN of the created IAM role.
- `role_id` — unique role ID assigned by AWS.

### External Modules

None. All code is local (root + `modules/iam_role`).

---

## 4. How Import Works

The `imports.sh` script in the root directory contains the import commands used to populate Terraform state with discovered cloud resources. These commands map Terraform addresses to their cloud identifiers:

```bash
terraform import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this' \
  'non-prod-adis-us-west-2-admin-task-execution-role'
```

**How it works:**
1. The script was executed once to import all discovered resources into state.
2. Each line uses `terraform import <terraform-address> <cloud-resource-id>`, mapping the module-qualified Terraform resource address to the cloud resource's identifier (role name or role/policy ARN).
3. The `-var-file` flag supplies variable values so Terraform can resolve the module's `for_each` key during import.

**To re-import a single resource** (if state is lost):
```bash
terraform init
terraform import -var-file environments/sg.tfvars \
  'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this' \
  'non-prod-adis-us-west-2-admin-task-execution-role'
```

Repeat for each policy attachment using the corresponding `role/policy-arn` identifier from `imports.sh`.

---

## 5. How to Use the Code

### Initialize Terraform

```bash
cd /mnt/sg_workspace/user/global-settings
terraform init
```

This downloads the AWS provider and prepares the working directory.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows any pending changes to AWS resources. (Currently should show 0/0/0.)

### Apply Changes

```bash
terraform apply -var-file=environments/sg.tfvars
```

This creates or updates resources to match the configuration.

### Target Another Environment

To manage IAM roles in a different environment (e.g., prod instead of non-prod):

1. **Copy the tfvars file:**
   ```bash
   cp environments/sg.tfvars environments/prod.tfvars
   ```

2. **Edit the new file** to change variable values:
   ```hcl
   iam_roles = {
     prod_adis_us_west_2_admin_task_execution_role = {
       name                 = "prod-adis-us-west-2-admin-task-execution-role"
       path                 = "/"
       max_session_duration = 3600
       assume_role_policy   = "..."
       attached_policy_arns = [...]
       tags                 = {...}
     }
   }
   ```

3. **Plan and apply with the new file:**
   ```bash
   terraform plan -var-file=environments/prod.tfvars
   terraform apply -var-file=environments/prod.tfvars
   ```

No `.tf` code changes are required; all configuration is externalized to tfvars files.

---

## 6. Variables

### Root Variable: `iam_roles`

**Type:** `map(object(...))`

**Description:** Map of IAM role configurations, keyed by a stable snake_case identifier (e.g., `non_prod_adis_us_west_2_admin_task_execution_role`).

**Current value (from `environments/sg.tfvars`):**
```hcl
iam_roles = {
  non_prod_adis_us_west_2_admin_task_execution_role = {
    name                 = "non-prod-adis-us-west-2-admin-task-execution-role"
    path                 = "/"
    max_session_duration = 3600
    assume_role_policy   = "{\"Version\":\"2012-10-17\",\"Statement\":[...]}"
    attached_policy_arns = [
      "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess",
    ]
    tags = {
      Environment   = "non-prod-adis"
      Warning       = "Do-Not-Modify-Or-Delete"
      Resource-Type = "ECS Cluster"
      ManagedBy     = "StackGuardian-Infra-Team"
    }
  }
}
```

**Sub-fields:**
- **`name`** (string, required) — the AWS IAM role name.
- **`path`** (string, optional, default = "/") — IAM path (typically "/" for role root).
- **`max_session_duration`** (number, optional, default = 3600) — maximum session duration in seconds; must be between 3600 (1 hour) and 43200 (12 hours).
- **`assume_role_policy`** (string, required) — JSON-encoded IAM trust policy document defining who can assume the role.
- **`attached_policy_arns`** (list(string), optional, default = []) — list of AWS managed or customer managed policy ARNs to attach to the role.
- **`tags`** (map(string), optional, default = {}) — AWS resource tags for governance and tracking.

**No sensitive variables:** All values are non-sensitive and visible in `environments/sg.tfvars`. No `secrets.auto.tfvars` file is needed.

---

## 7. Infrastructure Graph

```
module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"]
├── aws_iam_role.this
│   ├── assume_role_policy: trust policy JSON (allows ECS tasks and account root)
│   ├── tags (Environment, Warning, Resource-Type, ManagedBy)
│   └── [child resources]
│       ├── aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
│       │   └── policy_arn → AWS managed policy (AmazonECSTaskExecutionRolePolicy)
│       ├── aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]
│       │   └── policy_arn → AWS managed policy (AmazonElasticFileSystemFullAccess)
│       ├── aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
│       │   └── policy_arn → AWS managed policy (AmazonS3ReadOnlyAccess)
│       └── aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]
│           └── policy_arn → AWS managed policy (AmazonElasticFileSystemClientReadWriteAccess)
```

**Dependency notes:**
- All policy attachments depend on the IAM role existing first.
- Policy attachments reference AWS managed policies by ARN (no local creation).

---

## 8. Notable Decisions & Caveats

### Provider Region Configuration

**Decision:** AWS provider region set to `us-east-1` instead of `global`.

**Reason:** AWS regions must be valid AWS region identifiers. The original discovery data indicated `"region": "global"`, which is invalid for AWS provider configuration and causes DNS failures when the provider tries to reach STS endpoints. IAM is a global service, but the Terraform provider requires a canonical region endpoint; `us-east-1` is the standard choice for IAM management.

### No `lifecycle { ignore_changes }` Blocks

**Decision:** No lifecycle blocks were added to any resource.

**Reason:** All attributes of the IAM role (name, path, description, max_session_duration, assume_role_policy, tags) and policy attachments (role, policy_arn) are sourced from discovery data and tfvars. No computed attributes require drift suppression. The trust policy is static; policy ARNs are explicitly listed. Drift is expected to be zero.

### Description Field

**Decision:** `description` is set to `null` (omitted from tfvars).

**Reason:** The discovered resource metadata showed `"description": null`, indicating the IAM role has no description set. The module variable defaults to `null`, and no tfvars value was provided, so the role is created without a description. This matches cloud reality.

### Code Comments

**Applied:** Each resource block in `modules/iam_role/main.tf` includes a descriptive comment above it:
- `aws_iam_role.this` — "Primary IAM role resource"
- `aws_iam_role_policy_attachment.this` — "Attaches each managed policy ARN to the IAM role"

### Account ID and Region Scoping

**Account ID:** `790543352839` (from discovered resource ARN and tags).

**Region:** `global` (IAM resources are global; provider uses canonical `us-east-1`).

The IAM role ARN is `arn:aws:iam::790543352839:role/non-prod-adis-us-west-2-admin-task-execution-role`. The `us-west-2` suffix in the role name is a naming convention (for the resource's logical region) but does not restrict the role's availability.

### Reconciliation Result

**Final state:** Plan shows 0 resources to add, 0 to change, 0 to destroy. The infrastructure is fully managed and in sync.

---

## Usage Examples

### Add a New IAM Role

Edit `environments/sg.tfvars` and add a new entry to the `iam_roles` map:

```hcl
iam_roles = {
  non_prod_adis_us_west_2_admin_task_execution_role = {
    # ... existing role ...
  }
  prod_admin_task_execution_role = {
    name                 = "prod-admin-task-execution-role"
    path                 = "/"
    max_session_duration = 3600
    assume_role_policy   = jsonencode({
      Version = "2012-10-17"
      Statement = [{
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }]
    })
    attached_policy_arns = [
      "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
    ]
    tags = {
      Environment = "prod"
    }
  }
}
```

Then plan and apply:

```bash
terraform plan -var-file=environments/sg.tfvars
terraform apply -var-file=environments/sg.tfvars
```

### Attach an Additional Policy

Update the `attached_policy_arns` list for the desired role in tfvars:

```hcl
attached_policy_arns = [
  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
  "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess",
  "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
  "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess",
  "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"  # New policy
]
```

Plan and apply to attach the new policy.

### Remove a Role

Delete the role entry from `iam_roles` in tfvars:

```hcl
iam_roles = {
  # Remove the prod_admin_task_execution_role entry
}
```

Plan will show the role and its policy attachments for destruction; apply will delete them.

---

## Contacts & Maintenance

- **Generated:** 2026-06-23
- **Last reconciled:** No changes (plan 0/0/0)
- **Managed by:** StackGuardian Infrastructure Team (per tags)
- **Environment:** non-prod-adis (AWS Account ID: 790543352839)

For issues or changes, contact the StackGuardian Infra Team. Do not manually modify the IAM role in the AWS console; all changes must flow through this Terraform configuration.
