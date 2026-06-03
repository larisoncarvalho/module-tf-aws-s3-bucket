# dev-test-vnet-stack

## Description

Azure Virtual Network infrastructure for the dev-test environment in Germany West Central. This stack provisions and manages a virtual network and its configuration within an existing resource group.

---

## Module Overview

| Module | Path | Description |
|--------|------|-------------|
| `virtual_network` | `./modules/virtual_network` | Manages the dev-test virtual network and its associated subnets |

---

## Resources

| Resource Type | Logical Name | Description |
|---------------|--------------|-------------|
| `azurerm_virtual_network` | `this` | The primary virtual network resource |

---

## Variables Reference

### Root Variables

| Name | Type | Default | Description |
|------|------|---------|-------------|
| `region` | `string` | `"germanywestcentral"` | The Azure region where resources will be deployed |
| `virtual_network_name` | `string` | `"dev-test-vnet"` | The name of the virtual network |
| `resource_group_name` | `string` | `"dev-test-rg"` | The name of the resource group |
| `address_prefixes` | `list(string)` | `["10.100.0.0/16"]` | The address space used by the virtual network |
| `enable_ddos_protection` | `bool` | `false` | Whether DDoS protection plan is enabled |
| `tags` | `map(string)` | `{ ENV = "test" }` | A mapping of tags to assign to resources |

---

## Outputs Reference

| Name | Description |
|------|-------------|
| `virtual_network_id` | The ID of the virtual network |
| `virtual_network_name` | The name of the virtual network |

---

## Usage Instructions

### 1. Initialize

```sh
terraform init
```

### 2. Import Existing Resources

```sh
chmod +x imports.sh
./imports.sh terraform
```

### 3. Plan

```sh
terraform plan -var-file environments/sg.tfvars
```

### 4. Apply

```sh
terraform apply -var-file environments/sg.tfvars
```

---

## Notes

- This stack imports an existing Azure Virtual Network. Run `imports.sh` before the first `plan`/`apply` to avoid resource recreation.
- No credentials or secrets are stored in this configuration. Authenticate via `az login` or environment variables before running Terraform.
- The `skip_provider_registration` flag is set to `true` to avoid permission issues in environments where provider registration is restricted.