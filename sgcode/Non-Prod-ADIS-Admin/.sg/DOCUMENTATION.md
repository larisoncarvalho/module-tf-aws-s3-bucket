# Infrastructure Documentation: global-settings

## 1. Overview

This Terraform codebase manages a single AWS IAM role used for ECS task execution in a non-production environment. The infrastructure was generated from discovered cloud resources, imported into Terraform state, and reconciled until `plan` showed 0/0/0 changes — indicating perfect agreement between the code and the live infrastructure.

The stack consists of:
- **1 IAM Role** (`non-prod-adis-us-west-2-admin-task-execution-role`) — used as the task execution role for ECS tasks
- **4 IAM Policy Attachments** — enabling ECS task execution, EFS access, S3 read-only access, and EFS client read/write access

All resources have been imported into state and are fully managed by Terraform.

## 2. Resources

| Terraform Address | Provider | Resource Type | Real-World Name/ID | Purpose |
|---|---|---|---|---|
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this` | AWS | `aws_iam_role` | `non-prod-adis-us-west-2-admin-task-execution-role` | Primary IAM role for ECS task execution; allows assumption by ECS tasks and the AWS account root |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]` | AWS | `aws_iam_role_policy_attachment` | `non-prod-adis-us-west-2-admin-task-execution-role` + `AmazonECSTaskExecutionRolePolicy` | Attaches AWS managed policy for ECS task execution |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]` | AWS | `aws_iam_role_policy_attachment` | `non-prod-adis-us-west-2-admin-task-execution-role` + `AmazonElasticFileSystemFullAccess` | Attaches AWS managed policy for full EFS access |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]` | AWS | `aws_iam_role_policy_attachment` | `non-prod-adis-us-west-2-admin-task-execution-role` + `AmazonS3ReadOnlyAccess` | Attaches AWS managed policy for read-only S3 access |
| `module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]` | AWS | `aws_iam_role_policy_attachment` | `non-prod-adis-us-west-2-admin-task-execution-role` + `AmazonElasticFileSystemClientReadWriteAccess` | Attaches AWS managed policy for EFS client read/write access |

## 3. Module Structure

### `modules/iam_role/`

**Purpose:** Encapsulates the creation of a single AWS IAM role with optional managed policy attachments.

**Contained Resources:**
- `aws_iam_role.this` — the IAM role itself
- `aws_iam_role_policy_attachment.this` — a set of policy attachments (one per ARN in `attached_policy_arns`)

**Input Variables:**
- `name` (string, required) — the role name
- `path` (string, default: `"/"`) — the IAM path for the role
- `assume_role_policy` (string, required) — the trust relationship policy document (JSON string)
- `max_session_duration` (number, default: 3600) — maximum session duration in seconds
- `attached_policy_arns` (list(string), default: `[]`) — list of managed policy ARNs to attach
- `tags` (map(string), default: `{}`) — tags to apply to the role

**Outputs:**
- `role_name` — the name of the created IAM role
- `role_arn` — the ARN of the created IAM role

**Call Site:** Root module uses `for_each = var.iam_roles` to instantiate this module once per role configuration.

---

### Root Module (`main.tf`, `variables.tf`, `outputs.tf`)

**Structure:** Uses a single input variable `iam_roles` (a map of role configurations) and calls `module.iam_role` with `for_each` for each entry.

**Key Variables:**
- `iam_roles` (map(object({...}))) — map-keyed configuration for all IAM roles to manage

**Outputs:** None defined (the handoff notes that for_each map outputs are avoided to prevent stale-null traps).

---

## 4. How Import Works

The `imports.sh` script was run once during the initial setup to populate Terraform state with the discovered resources. It uses `terraform import` (or the OpenTofu equivalent) to bind each resource in the code to its corresponding cloud resource.

**Import Commands Executed:**

1. **Role itself:**
   ```sh
   terraform import -var-file environments/sg.tfvars \
     'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role.this' \
     'non-prod-adis-us-west-2-admin-task-execution-role'
   ```

2. **Policy attachment (AmazonECSTaskExecutionRolePolicy):**
   ```sh
   terraform import -var-file environments/sg.tfvars \
     'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]' \
     'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy'
   ```

3. **Policy attachment (AmazonElasticFileSystemFullAccess):**
   ```sh
   terraform import -var-file environments/sg.tfvars \
     'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]' \
     'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess'
   ```

4. **Policy attachment (AmazonS3ReadOnlyAccess):**
   ```sh
   terraform import -var-file environments/sg.tfvars \
     'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]' \
     'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess'
   ```

5. **Policy attachment (AmazonElasticFileSystemClientReadWriteAccess):**
   ```sh
   terraform import -var-file environments/sg.tfvars \
     'module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"].aws_iam_role_policy_attachment.this["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]' \
     'non-prod-adis-us-west-2-admin-task-execution-role/arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess'
   ```

**Note:** These commands need not be re-run unless state is completely lost. To re-import a single resource if state is lost, use the exact command shown above, replacing the binary path and variable file as needed.

---

## 5. How to Use the Code

### Initialize Terraform

```bash
terraform init
```

This downloads the AWS provider and initializes the working directory.

### Plan Changes

```bash
terraform plan -var-file=environments/sg.tfvars
```

This shows any pending changes. After import and reconciliation, the output should be:
```
No changes. Infrastructure matches configuration.
```

### Apply Configuration

```bash
terraform apply -var-file=environments/sg.tfvars
```

This applies any pending changes (there should be none if the plan is clean).

### Target Another Environment

To manage the same infrastructure in a different environment (e.g., dev, staging, prod):

1. **Copy and edit the variables file:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   # Edit environments/dev.tfvars and change the role name, ARNs, tags, etc.
   ```

2. **Plan with the new file:**
   ```bash
   terraform plan -var-file=environments/dev.tfvars
   ```

3. **Apply (if changes are acceptable):**
   ```bash
   terraform apply -var-file=environments/dev.tfvars
   ```

**No `.tf` code edits are required** — the module is generic and driven entirely by the `iam_roles` map in the variables file.

---

## 6. Variables

### `iam_roles` (root module)

- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Sensitivity:** Not marked sensitive
- **Description:** Map of IAM role instances to manage, keyed by a stable snake_case identifier.
- **Object fields:**
  - `name` (string, required) — the name of the IAM role
  - `path` (string, optional, default: `"/"`) — the IAM path for the role
  - `assume_role_policy` (string, required) — the trust relationship policy document as a JSON string
  - `max_session_duration` (number, optional, default: 3600) — maximum session duration in seconds
  - `attached_policy_arns` (list(string), optional, default: `[]`) — list of AWS managed policy ARNs to attach
  - `tags` (map(string), optional, default: `{}`) — tags to apply to the role

**Example in `environments/sg.tfvars`:**
```hcl
iam_roles = {
  non_prod_adis_us_west_2_admin_task_execution_role = {
    name = "non-prod-adis-us-west-2-admin-task-execution-role"
    path = "/"
    assume_role_policy = "{...}"
    max_session_duration = 3600
    attached_policy_arns = [
      "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess",
      "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess",
      "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess",
    ]
    tags = {
      Environment = "non-prod-adis"
      Warning = "Do-Not-Modify-Or-Delete"
      "Resource-Type" = "ECS Cluster"
      ManagedBy = "StackGuardian-Infra-Team"
    }
  }
}
```

### Sensitive Variables

**None.** No variables are marked as sensitive, and no `secrets.auto.tfvars` file is required. All values in the discovered resource are non-secret (no credentials, tokens, or keys). The `assume_role_policy` is a JSON policy document, not a secret.

---

## 7. Infrastructure Graph

```
module.iam_role["non_prod_adis_us_west_2_admin_task_execution_role"]
├── aws_iam_role.this
│   └── non-prod-adis-us-west-2-admin-task-execution-role
│       └── [Trust policy allows: ECS tasks service + account root]
│
└── aws_iam_role_policy_attachment.this (for_each over 4 policy ARNs)
    │
    ├── ["arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"]
    │   └── aws_iam_role_policy_attachment.this
    │       └── Attaches to: non-prod-adis-us-west-2-admin-task-execution-role
    │
    ├── ["arn:aws:iam::aws:policy/AmazonElasticFileSystemFullAccess"]
    │   └── aws_iam_role_policy_attachment.this
    │       └── Attaches to: non-prod-adis-us-west-2-admin-task-execution-role
    │
    ├── ["arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"]
    │   └── aws_iam_role_policy_attachment.this
    │       └── Attaches to: non-prod-adis-us-west-2-admin-task-execution-role
    │
    └── ["arn:aws:iam::aws:policy/AmazonElasticFileSystemClientReadWriteAccess"]
        └── aws_iam_role_policy_attachment.this
            └── Attaches to: non-prod-adis-us-west-2-admin-task-execution-role
```

**Reference Direction:**
- Each `aws_iam_role_policy_attachment.this[policy_arn]` **references** `aws_iam_role.this.name` via its `role` argument
- Thus: `aws_iam_role_policy_attachment` → `aws_iam_role` (dependency)

---

## 8. Notable Decisions & Caveats

### `assume_role_policy` Storage

The trust relationship policy is stored as a **raw JSON string** in `environments/sg.tfvars`. This is necessary because `.tfvars` files do not support HCL expressions like `jsonencode()`. The JSON is provided by the discovery tool and passed directly to the `aws_iam_role` resource's `assume_role_policy` argument, which accepts a string.

**Example:**
```hcl
assume_role_policy = "{\"Version\":\"2012-10-17\",\"Statement\":[...]}"
```

### Provider Configuration: Region & Global Endpoints

The `providers.tf` file specifies `region = "us-east-1"` and explicitly configures STS and IAM endpoints:
```hcl
provider "aws" {
  region = "us-east-1"
  endpoints {
    sts = "https://sts.amazonaws.com"
    iam = "https://iam.amazonaws.com"
  }
}
```

**Reason:** IAM is a global AWS service, not tied to a specific region. The discovery tool returned the resource with region = "global", which is invalid for Terraform. The provider was configured with:
- A valid AWS region (`us-east-1`) as a fallback
- Explicit global endpoints for STS and IAM to ensure operations target the correct global endpoints

### No `lifecycle { ignore_changes }`

No `lifecycle` blocks are present in the code. All attributes of the IAM role (name, path, assume_role_policy, tags, max_session_duration) are sourced from the configuration in `sg.tfvars` and are not computed or drift-prone.

### No Secrets / `secrets.auto.tfvars`

No sensitive values exist in the discovered resource. The role's assume policy, policy attachments, and tags are all non-secret configuration. No `secrets.auto.tfvars` file is required or has been created.

### Module Generality

The `iam_role` module is designed to be **reusable and generic**. A single `for_each` loop in the root module can manage **any number of IAM roles** by adding entries to the `iam_roles` map in the variables file. Currently, only one role is instantiated, but the structure supports multi-role scenarios without code changes.

### Reconciliation Status

**Plan output:** No changes. Infrastructure matches configuration (0 to add, 0 to change, 0 to destroy).

All discovered resources have been successfully imported and reconciled. The code is ready for ongoing management (updates, new roles, or deletions via changes to `environments/sg.tfvars`).

---

**Generated:** 2026-06-23  
**Infrastructure Tool:** Terraform/OpenTofu  
**AWS Account ID:** 790543352839  
**Providers:** AWS (hashicorp/aws, global service endpoints)