# azure-storage-accounts

## Description

Azure Storage Accounts with associated blob containers across multiple regions and resource groups. This stack manages multiple Azure Storage Accounts using the `terraform-azurerm-storage-account` external module, supporting blob containers with configurable access tiers, SKUs, and hierarchical namespace settings.

## Module Overview

| Module Call | Source | Description |
|---|---|---|
| `storage_accounts` | `git::https://github.com/WeAreRetail/terraform-azurerm-storage-account.git?ref=master` | Creates Azure Storage Accounts and associated blob containers |

## Storage Accounts

| Key | Custom Name | Resource Group | Kind | SKU | Containers |
|---|---|---|---|---|---|
| `bloblogging` | bloblogging | networkwatcherrg | StorageV2 | Standard_LRS | none |
| `autoscalersgrunnsfhb4vyt` | autoscalersgrunnsfhb4vyt | adis-eu | StorageV2 | Standard_LRS | autoscaler-state, deployments |
| `stgbackendsgrunnnz6ztbrv` | stgbackendsgrunnnz6ztbrv | adis-eu | StorageV2 | Standard_LRS | runner, system |
| `romedocspipeline` | romedocspipeline | arunim-test-resource-group | StorageV2 | Standard_LRS | docs |
| `autoscaleprivaterunbe10` | autoscaleprivaterunbe10 | autoscale-private-runner_group-bd75 | Storage | Standard_LRS | azure-webjobs-hosts, azure-webjobs-secrets, scm-releases |

## Variables Reference

| Name | Type | Description |
|---|---|---|
| `region` | `string` | The Azure region to deploy resources into |
| `storage_accounts` | `map(object({...}))` | Map of storage account configurations including containers and tags |

## Outputs Reference

| Name | Description |
|---|---|
| `storage_account_ids` | Map of storage account IDs keyed by map key |
| `storage_account_names` | Map of storage account names keyed by map key |
| `storage_primary_blob_endpoints` | Map of primary blob endpoints keyed by map key |

## Usage Instructions

### 1. Initialize

```sh
terraform init
# or
tofu init
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
# or
tofu plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
# or
tofu apply -var-file environments/sg.tfvars
```