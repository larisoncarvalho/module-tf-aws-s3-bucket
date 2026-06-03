# key-vault-administrator-role-definition

## Description

Manages the Key Vault Administrator custom role definition scoped to the subscription, granting all data plane operations on key vaults and their objects.

## Module Overview

| Module | Description |
|--------|-------------|
| `role_definition` | Manages the Key Vault Administrator Azure role definition |

## Variables Reference

| Name | Type | Description |
|------|------|-------------|
| `role_definition_id` | `string` | The unique UUID/GUID identifying this role definition. |
| `name` | `string` | The name of the Role Definition. |
| `scope` | `string` | The scope at which the Role Definition applies. |
| `description` | `string` | A description of the Role Definition. |
| `assignable_scopes` | `list(string)` | One or more assignable scopes for this Role Definition. |
| `permissions_actions` | `list(string)` | Allowed actions for the permissions block. |
| `permissions_data_actions` | `list(string)` | Allowed data actions for the permissions block. |

## Outputs Reference

| Name | Description |
|------|-------------|
| `id` | The Terraform-specific ID of the role definition (format: `{roleDefinitionId}\|{scope}`). |
| `role_definition_id` | The Role Definition ID. |
| `role_definition_resource_id` | The Azure Resource Manager ID for the resource. |

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
chmod +x imports.sh
./imports.sh terraform
# or for OpenTofu:
./imports.sh tofu
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```

## Notes

- The `scope` value is automatically included in `assignable_scopes` by the provider if no other values are supplied.
- The Terraform resource ID is of the format `{roleDefinitionId}|{scope}`.
- This role definition grants full data plane access to Azure Key Vaults using the Azure RBAC permission model.