# Azure Network Resource Group Stack

## Overview

This Terraform stack manages an Azure resource group for network resources in the East US region.

## Stack Information

- **Name**: azure-network-resource-group
- **Description**: Azure resource group for network resources
- **Region**: eastus

## Modules

### resource_group

Manages Azure resource group.

**Location**: `modules/resource_group/`

**Resources**:
- `azurerm_resource_group.this` - Azure resource group

## Variables

| Name | Type | Description | Default |
|------|------|-------------|---------|
| region | string | Azure region for resources | eastus |
| subscription_id | string | Azure subscription ID | - |

## Outputs

| Name | Description |
|------|-------------|
| resource_group_id | ID of the resource group |
| resource_group_name | Name of the resource group |

## Usage

### Prerequisites

- Terraform installed (latest version)
- Azure CLI installed and authenticated
- Valid Azure subscription

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

### Configuration

Edit `environments/terraform.tfvars` to customize:
- Azure region
- Azure subscription ID

### Resource Details

The stack creates:
- 1 Azure resource group named "azurenetwork"
- Tags: app=azurenetwork, creator=stackgurdian, environment=default

## Import

This stack is designed to import an existing Azure resource group. The import script will attach the existing resource to Terraform state management without modifying it.

## Notes

- Ensure the resource group "azurenetwork" exists in your Azure subscription before running imports
- The subscription_id must be set in terraform.tfvars
- After import, terraform plan should show zero changes if the configuration matches the existing resource