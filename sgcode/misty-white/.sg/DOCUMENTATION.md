# Key Vault Administrator Role Definition Stack

## Overview

This stack manages the Azure built-in Key Vault Administrator role definition. The Key Vault Administrator role allows performing all data plane operations on a key vault and all objects in it, including certificates, keys, and secrets. This role only works for key vaults that use the Azure role-based access control permission model.

## Architecture

The stack consists of a single module that manages the Azure role definition resource:

- **role_definition**: Manages the Key Vault Administrator built-in role definition with predefined permissions and scopes

## Modules

### role_definition

Manages the Key Vault Administrator built-in role definition.

**Resources:**
- `azurerm_role_definition.this` - The role definition resource

**Variables:**

| Name | Type | Description |
|------|------|-------------|
| role_definition_id | string | The unique identifier for the role definition |
| role_name | string | The name of the role definition |
| scope | string | The scope at which the role definition applies |
| description | string | The description of the role definition |
| actions | list(string) | The list of allowed actions for the role |
| assignable_scopes | list(string) | The list of scopes where the role can be assigned |

**Outputs:**

| Name | Description |
|------|-------------|
| id | The ID of the role definition |
| role_definition_id | The unique identifier for the role definition |
| name | The name of the role definition |

## Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | The Azure region for the resources | global |

## Root Outputs

| Name | Description |
|------|-------------|
| role_definition_id | The unique identifier for the Key Vault Administrator role definition |
| role_name | The name of the Key Vault Administrator role definition |

## Usage

### Initial Deployment

1. **Initialize Terraform:**
   ```bash
   terraform init
   ```

2. **Import Existing Resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review the Plan:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply the Configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Permissions

The Key Vault Administrator role includes the following permissions:

**Actions:**
- `Microsoft.Authorization/*/read` - Read authorization information
- `Microsoft.Insights/alertRules/*` - Manage alert rules
- `Microsoft.Resources/deployments/*` - Manage deployments
- `Microsoft.Resources/subscriptions/resourceGroups/read` - Read resource groups
- `Microsoft.Support/*` - Manage support tickets
- `Microsoft.KeyVault/checkNameAvailability/read` - Check key vault name availability
- `Microsoft.KeyVault/deletedVaults/read` - Read deleted vaults
- `Microsoft.KeyVault/locations/*/read` - Read location-specific information
- `Microsoft.KeyVault/vaults/*/read` - Read key vault information
- `Microsoft.KeyVault/operations/read` - Read key vault operations

**Assignable Scopes:**
- `/` - Root scope (entire tenant)

## Notes

- This role definition is a built-in Azure role with ID `00482a5a-887f-4fb3-b363-3b7fe8e74483`
- The role can only be used with key vaults configured to use Azure RBAC for data plane access
- The role cannot manage key vault resources or role assignments themselves
- The scope is set to `/` (root), making it available across the entire Azure tenant