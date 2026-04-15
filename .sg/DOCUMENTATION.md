# key-vault-rbac-roles

Azure Key Vault built-in RBAC role definitions

## Overview

This stack manages Azure RBAC role definitions for Key Vault. It provides a reusable module for defining custom or built-in role definitions with granular control over management plane and data plane permissions.

## Modules

### role_definition

Manages Azure RBAC role definitions with configurable permissions for both management and data plane operations.

**Location:** `modules/role_definition`

**Resources:**
- `azurerm_role_definition.this` - Azure role definition resource

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region for the stack | - |

## Outputs

| Name | Description |
|------|-------------|
| key_vault_administrator_id | The ID of the Key Vault Administrator role definition |
| key_vault_administrator_role_definition_id | The role definition ID of the Key Vault Administrator role |

## Module: role_definition

### Variables

| Name | Type | Description |
|------|------|-------------|
| role_name | string | Display name of the role definition |
| assignable_scope | string | Primary scope where this role can be assigned |
| description | string | Description of the role's purpose and permissions |
| actions | list(string) | Management plane actions allowed by this role |
| data_actions | list(string) | Data plane actions allowed by this role |
| not_actions | list(string) | Management plane actions explicitly denied |
| not_data_actions | list(string) | Data plane actions explicitly denied |

### Outputs

| Name | Description |
|------|-------------|
| id | The ID of the role definition |
| role_definition_id | The role definition ID |

## Usage

### Initialize

```bash
terraform init
```

### Import Existing Resources

```bash
chmod +x imports.sh
./imports.sh
```

### Plan

```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply

```bash
terraform apply -var-file=environments/terraform.tfvars
```

## Notes

- This stack imports existing Azure role definitions
- The Key Vault Administrator role provides full data plane access to Key Vault resources
- Role definitions use the Azure RBAC permission model
- The assignable scope is set to "/" (root) allowing assignment at any scope level