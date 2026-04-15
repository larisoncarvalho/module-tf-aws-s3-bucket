# Azure Resource Group Infrastructure

## Overview

This stack manages an Azure resource group using OpenTofu/Terraform. It provides a simple, reusable module for creating and managing Azure resource groups with customizable names, locations, and tags.

## Stack Description

- **Name**: azure-resource-group
- **Description**: Azure resource group infrastructure
- **Region**: eastus

## Module Overview

### resource_group

Manages Azure resource group resources.

**Location**: `modules/resource_group/`

**Resources**:
- `azurerm_resource_group.this` - Azure resource group

## Variables

### Root Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region | "eastus" |

### Module: resource_group

| Name | Type | Description | Default |
|------|------|-------------|---------|
| name | string | Name of the resource group | (required) |
| location | string | Azure region for the resource group | (required) |
| tags | map(string) | Tags to apply to the resource group | {} |

## Outputs

### Root Outputs

| Name | Description |
|------|-------------|
| resource_group_id | Resource group ID |
| resource_group_name | Resource group name |

### Module: resource_group

| Name | Description |
|------|-------------|
| id | Resource group ID |
| name | Resource group name |

## Usage

### Prerequisites

- OpenTofu/Terraform >= 1.0
- Azure CLI configured with appropriate credentials
- AzureRM provider ~> 3.0

### Deployment Steps

1. **Initialize the workspace**:
   ```bash
   terraform init
   ```

2. **Import existing resources** (if applicable):
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review the execution plan**:
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply the configuration**:
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Module Usage Example

```hcl
module "my_resource_group" {
  source = "./modules/resource_group"

  name     = "my-rg"
  location = "eastus"
  tags = {
    environment = "production"
    team        = "platform"
  }
}
```

## Notes

- This stack is designed to import an existing Azure resource group named "azurenetwork"
- The import script must be run before applying changes to avoid resource recreation
- All resources are tagged with app, creator, and environment metadata
- The resource group location is set to "eastus" by default

## Authentication

Ensure you have authenticated with Azure using one of the following methods:
- Azure CLI: `az login`
- Service Principal with environment variables
- Managed Identity (when running in Azure)

The provider will use the default Azure credentials from your environment.