# Azure Resource Groups Infrastructure

## Overview

This stack manages Azure Resource Groups infrastructure in the eastus region. It provides a reusable module for creating and managing multiple resource groups with custom configurations including location and tags.

## Architecture

The stack consists of a single module that manages Azure Resource Groups:

- **resource_group**: Creates and manages Azure Resource Groups with configurable locations and tags

## Modules

### resource_group

Manages Azure Resource Groups with support for multiple instances via a map-based configuration.

**Resources:**
- `azurerm_resource_group.this` - Azure Resource Group instances

**Inputs:**

| Name | Type | Description | Default |
|------|------|-------------|---------|
| resource_groups | map(object({ location = string, tags = map(string) })) | Resource groups to create with their configurations | {} |

**Outputs:**

| Name | Description |
|------|-------------|
| resource_group_ids | Map of resource group names to their IDs |
| resource_group_names | Map of resource group keys to their names |

## Root Configuration

### Variables

| Name | Type | Description |
|------|------|-------------|
| region | string | Azure region for resources |
| resource_groups | map(object({ location = string, tags = map(string) })) | Resource groups to create with their configurations |

### Outputs

| Name | Description |
|------|-------------|
| resource_group_ids | Map of resource group names to their IDs |
| resource_group_names | Map of resource group keys to their names |

## Current Configuration

The stack is configured to manage two resource groups:

1. **azurestack101** - Located in eastus with app, creator, and environment tags
2. **azurestackoct11** - Located in eastus with creator and environment tags

## Usage

### Prerequisites

- OpenTofu/Terraform installed
- Azure CLI authenticated or service principal credentials configured
- Appropriate Azure subscription permissions

### Deployment Steps

1. **Initialize the workspace:**
   ```bash
   terraform init
   ```

2. **Import existing resources:**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review the execution plan:**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply the configuration:**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Customization

To add or modify resource groups, update the `resource_groups` variable in `environments/terraform.tfvars`:

```hcl
resource_groups = {
  my_new_rg = {
    location = "westus2"
    tags = {
      environment = "production"
      team        = "platform"
    }
  }
}
```

## Import Notes

This stack imports existing Azure Resource Groups. The import script (`imports.sh`) contains commands to import the current resource groups into Terraform state. After running the import script, `terraform plan` should show zero changes, indicating successful state synchronization.

## Security Considerations

- Resource group names and tags are managed through variables
- No sensitive data is hardcoded in the configuration
- Azure credentials should be managed through environment variables or Azure CLI authentication
- Review and audit tags for compliance with organizational policies