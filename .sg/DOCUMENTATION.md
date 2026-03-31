# Azure Network Resource Group Stack

## Overview

This Terraform stack manages an Azure resource group for network infrastructure in the eastus region.

## Architecture

The stack consists of a single module that creates and manages an Azure resource group with configurable name, location, and tags.

### Modules

#### resource_group

Manages Azure resource group lifecycle.

**Resources:**
- `azurerm_resource_group.this` - Azure resource group

**Inputs:**
| Name | Type | Description | Default |
|------|------|-------------|---------|
| name | string | Resource group name | - |
| location | string | Azure region for the resource group | - |
| tags | map(string) | Tags to apply to the resource group | {} |

**Outputs:**
| Name | Description |
|------|-------------|
| id | Resource group ID |
| name | Resource group name |

## Root Configuration

### Module Calls

- **azurenetwork**: Creates the resource group with name "azurenetwork" in eastus region with default tags

### Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region | eastus |

### Outputs

| Name | Description |
|------|-------------|
| resource_group_id | Resource group ID |
| resource_group_name | Resource group name |

## Usage

### Prerequisites

- Terraform >= 0.13
- Azure CLI configured with appropriate credentials
- Appropriate Azure permissions to manage resource groups

### Deployment Steps

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Import Existing Resources**
   ```bash
   chmod +x imports.sh
   ./imports.sh
   ```

3. **Review Changes**
   ```bash
   terraform plan -var-file=environments/terraform.tfvars
   ```

4. **Apply Configuration**
   ```bash
   terraform apply -var-file=environments/terraform.tfvars
   ```

### Importing Existing Resources

This stack is designed to import an existing Azure resource group. The import script will attach the existing resource group "azurenetwork" to Terraform state management without making any changes to the actual infrastructure.

After running the import script, `terraform plan` should show zero changes, confirming that the Terraform configuration matches the existing infrastructure.

## Notes

- The resource group is configured with fixed values for name, location, and tags in the root module call
- The stack uses the AzureRM provider with default features
- All resources are tagged with app, creator, and environment metadata