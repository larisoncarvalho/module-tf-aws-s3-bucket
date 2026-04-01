# Azure Network Terraform Configuration

## Overview
This Terraform configuration manages an Azure resource group for network resources.

## Prerequisites

### Azure Authentication
This configuration requires Azure authentication. You must have one of the following:

1. **Azure CLI** (Recommended for local development)
   - Install Azure CLI: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli
   - Login: `az login`
   - Set subscription: `az account set --subscription <subscription-id>`

2. **Service Principal** (Recommended for CI/CD)
   - Set environment variables:
     - `ARM_CLIENT_ID`
     - `ARM_CLIENT_SECRET`
     - `ARM_TENANT_ID`
     - `ARM_SUBSCRIPTION_ID`

3. **Managed Identity** (For Azure resources)
   - Enable system-assigned or user-assigned managed identity
   - Set `ARM_USE_MSI=true`

### Required Variables
Update `environments/terraform.tfvars` with your values:
- `region`: Azure region (e.g., "eastus", "westus2")
- `subscription_id`: Your Azure subscription ID

## Usage

### Initialize Terraform
```bash
terraform init
```

### Plan Changes
```bash
terraform plan -var-file=environments/terraform.tfvars
```

### Apply Changes
```bash
terraform apply -var-file=environments/terraform.tfvars
```

### Import Existing Resources
If the resource group already exists in Azure:
```bash
export ARM_SUBSCRIPTION_ID=your-subscription-id
./imports.sh
```

## Resources Created
- Azure Resource Group: `azurenetwork`
  - Tags: app, creator, environment

## Outputs
- `resource_group_id`: The Azure resource ID
- `resource_group_name`: The resource group name

## Troubleshooting

### Error: "az": executable file not found
- Install Azure CLI or configure alternative authentication method (see Prerequisites)

### Error: No value for required variable
- Ensure `environments/terraform.tfvars` exists with required values
- Or pass variables via command line: `-var="region=eastus" -var="subscription_id=..."`

### Import Failures
- Verify `ARM_SUBSCRIPTION_ID` environment variable is set
- Ensure the resource group exists in Azure
- Check you have appropriate permissions on the subscription