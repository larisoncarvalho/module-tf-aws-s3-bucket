# role-assignment-user-administrator

## Description

Azure role assignment granting a built-in role to a user at root scope.

## Module Overview

| Module | Description |
|--------|-------------|
| `role_assignment` | Manages an Azure role assignment for a user principal |

## Variables Reference

| Name | Type | Description | Default |
|------|------|-------------|---------|
| `region` | string | The region for the stack | — |
| `role_assignment_name` | string | The GUID name of the role assignment | — |
| `principal_id` | string | The object ID of the user principal to assign the role to | — |
| `role_definition_id` | string | The fully qualified ID of the role definition to assign | — |
| `scope` | string | The scope at which the role assignment applies | — |

## Outputs Reference

| Name | Description |
|------|-------------|
| `role_assignment_id` | The ID of the role assignment |
| `role_assignment_principal_id` | The principal ID of the role assignment |

## Usage Instructions

### 1. Initialize

```sh
terraform init
# or
tofu init
```

### 2. Import Existing Resources

```sh
./imports.sh terraform
# or
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
# or
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
# or
tofu apply -var-file environments/sg.tfvars
```

## Resource Details

### Role Assignment

- **Resource**: `azurerm_role_assignment`
- **Name (GUID)**: `1bb730a7-e678-46e3-b447-f8787ec2d6a5`
- **Principal ID**: `5c41be92-5dc7-4d90-a130-d2cec7521f18`
- **Role Definition**: `/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/providers/Microsoft.Authorization/roleDefinitions/18d7d88d-d35e-4fb5-a5c3-7773c20a72d9`
- **Scope**: `/` (root)