# Terraform/OpenTofu Infrastructure Documentation

## 1. Overview

This Terraform configuration manages Azure compute and network resources discovered in the subscription `a97621d8-9158-4681-81b6-38b1222afba4`, primarily supporting a Windows Virtual Machine used as a host in an Azure Virtual Desktop (AVD) deployment.

**What was done:**
- Cloud resources were discovered and enumerated from Azure.
- IaC code was generated with inline resource definitions.
- All discovered resources were imported into Terraform state using `imports.sh`.
- The configuration was reconciled by running `plan` until no changes were detected (0/0/0).
- The code is now production-ready with full state parity.

**Resources managed:**
- 1 Azure Public IP address (`pip-egewg-westeurope-subnet1`)
- 1 Network Interface (`arunim-host-0-nic`)
- 1 Managed Disk (OS disk for the VM)
- 1 Virtual Machine (`arunim-host-0`, a Windows 10 Enterprise Gen2 host)

---

## 2. Resources

| Terraform Address | Provider | Real-World Name / ID | Purpose |
|-------------------|----------|----------------------|---------|
| `module.public_ip["pip_egewg_westeurope_subnet1"].azurerm_public_ip.this` | azurerm | `pip-egewg-westeurope-subnet1` (20.16.176.224) | Static public IP for VM network interface in West Europe region |
| `module.network_interface["arunim_host_0_nic"].azurerm_network_interface.this` | azurerm | `arunim-host-0-nic` | Primary network interface with static private IP 10.100.1.4, connected to subnet and public IP |
| `module.managed_disk["arunim_host_0_osdisk"].azurerm_managed_disk.this` | azurerm | `arunim-host-0_osdisk_1_498f48af84094a03a30c1a9efe99c319` | 128 GB StandardSSD OS disk (Windows) for the VM |
| `module.virtual_machine["arunim_host_0"].azurerm_virtual_machine.this` | azurerm | `arunim-host-0` | Windows 10 22H2 Enterprise Gen2 VM (Standard_D2s_v3), running as AVD session host |

---

## 3. Module Structure

The code is organized into four local reusable modules, each manageable independently:

### Module: `modules/public_ip`
- **Resource type:** `azurerm_public_ip`
- **Call style:** `for_each` from root (key map)
- **Variables:** name, resource_group_name, location, allocation_method, sku (default: "Basic"), ip_version (default: "IPv4"), tags
- **Outputs:** id, ip_address
- **Purpose:** Provision Azure public IP addresses with flexible allocation and tagging

### Module: `modules/network_interface`
- **Resource type:** `azurerm_network_interface`
- **Call style:** `for_each` from root (key map)
- **Variables:** name, resource_group_name, location, enable_accelerated_networking, ip_forwarding_enabled, tags, ip_configurations (list of IP configs with subnet and public IP references)
- **Outputs:** id
- **Purpose:** Create network interfaces with one or more IP configurations, each optionally linked to a public IP and subnet
- **Dependency:** Explicitly depends on `module.public_ip` to ensure public IPs exist before attachment

### Module: `modules/managed_disk`
- **Resource type:** `azurerm_managed_disk`
- **Call style:** `for_each` from root (key map)
- **Variables:** name, resource_group_name, location, storage_account_type, create_option (default: "Empty"), disk_size_gb, os_type, hyper_v_generation, image_reference_id, tags
- **Outputs:** id
- **Purpose:** Provision managed disks for VMs, supporting both OS and data disks, with optional image-based initialization

### Module: `modules/virtual_machine`
- **Resource type:** `azurerm_virtual_machine`
- **Call style:** `for_each` from root (key map)
- **Variables:** name, resource_group_name, location, vm_size, admin_username, admin_password (sensitive, optional), network_interface_ids (resolved from root), os_disk_name, os_disk_caching (default: "ReadWrite"), os_disk_create_option (default: "FromImage"), os_disk_managed_disk_type, image_publisher, image_offer, image_sku, image_version (default: "latest"), identity_type, provision_vm_agent (default: true), enable_automatic_upgrades (default: false), boot_diagnostics_enabled (default: false), boot_diagnostics_storage_uri, ultra_ssd_enabled (default: false), tags
- **Outputs:** id
- **Purpose:** Create Windows and Linux VMs with configurable OS, networking, boot diagnostics, and system-assigned managed identity
- **Lifecycle:** `ignore_changes = [os_profile]` to prevent drift from write-only password field
- **Dependency:** Depends on both `module.network_interface` and `module.managed_disk` to ensure NICs and disks are ready

**Root module structure:**
- `main.tf`: Four `for_each` module blocks (public_ip, network_interface, managed_disk, virtual_machine) with explicit dependencies
- `variables.tf`: Schema for `var.public_ips`, `var.network_interfaces`, `var.managed_disks`, `var.virtual_machines` (all maps) and `var.subscription_id` (string, default set)
- `outputs.tf`: Empty comment (no top-level enumerated outputs to avoid stale-null trap with for_each)
- `providers.tf`: Single azurerm provider using `var.subscription_id`
- `versions.tf`: Required provider specification (hashicorp/azurerm)

---

## 4. How Import Works

### imports.sh

The `imports.sh` script contains a list of `terraform import` commands that populate the Terraform state with already-existing Azure resources. Each line maps a **module-qualified Terraform address** to its **Azure resource ID**:

```bash
# Line 4: Public IP
terraform import -var-file environments/sg.tfvars \
  'module.public_ip["pip_egewg_westeurope_subnet1"].azurerm_public_ip.this' \
  '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Network/publicIPAddresses/pip-egewg-westeurope-subnet1'

# Line 6: Network Interface
terraform import -var-file environments/sg.tfvars \
  'module.network_interface["arunim_host_0_nic"].azurerm_network_interface.this' \
  '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Network/networkInterfaces/arunim-host-0-nic'

# Line 8: Managed Disk
terraform import -var-file environments/sg.tfvars \
  'module.managed_disk["arunim_host_0_osdisk"].azurerm_managed_disk.this' \
  '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Compute/disks/arunim-host-0_osdisk_1_498f48af84094a03a30c1a9efe99c319'

# Line 10: Virtual Machine
terraform import -var-file environments/sg.tfvars \
  'module.virtual_machine["arunim_host_0"].azurerm_virtual_machine.this' \
  '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Compute/virtualMachines/arunim-host-0'
```

**How it works:**
1. The script was executed **once** during initial state population.
2. Each `import` command reads the current Azure resource and records it in `terraform.tfstate`.
3. The script is **not run again** unless state is lost or a new resource is discovered.

**To re-import a single resource** (e.g., if state is corrupted):
```bash
terraform init  # Ensure backend and plugins are ready
terraform import -var-file environments/sg.tfvars \
  'module.virtual_machine["arunim_host_0"].azurerm_virtual_machine.this' \
  '/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Compute/virtualMachines/arunim-host-0'
```

---

## 5. How to Use the Code

### Prerequisites
- Terraform/OpenTofu binary available (e.g., `/tmp/tmp.ddEmeP/terraform`)
- Azure credentials configured (via `AZURE_*` env vars, `az` CLI login, or Managed Identity)
- Working directory: `/mnt/sg_workspace/user/global-settings`

### Typical Workflow

#### Initialize the working directory:
```bash
cd /mnt/sg_workspace/user/global-settings
/tmp/tmp.ddEmeP/terraform init
```

#### Plan changes (with production values):
```bash
/tmp/tmp.ddEmeP/terraform plan -var-file=environments/sg.tfvars
```

Expected output: **No changes. Your infrastructure matches the configuration.** (0/0/0)

#### Apply changes:
```bash
/tmp/tmp.ddEmeP/terraform apply -var-file=environments/sg.tfvars
```

Expected: instant success (no actual changes).

### Targeting Another Environment

To manage a **different environment** (e.g., development vs. production), create a new variables file:

1. **Copy the template:**
   ```bash
   cp environments/sg.tfvars environments/dev.tfvars
   ```

2. **Edit the new file** with dev-specific values:
   ```hcl
   # environments/dev.tfvars
   subscription_id = "different-subscription-id"
   
   public_ips = {
     "pip_dev_westeurope" = {
       name                = "pip-dev-westeurope"
       resource_group_name = "dev-resource-group"
       location            = "westeurope"
       allocation_method   = "Static"
       sku                 = "Standard"
       ip_version          = "IPv4"
       tags                = { Environment = "dev" }
     }
   }
   
   virtual_machines = {
     "dev_host_0" = {
       # ... dev VM config ...
     }
   }
   ```

3. **Plan against dev:**
   ```bash
   /tmp/tmp.ddEmeP/terraform plan -var-file=environments/dev.tfvars
   ```

4. **Apply to dev:**
   ```bash
   /tmp/tmp.ddEmeP/terraform apply -var-file=environments/dev.tfvars
   ```

**Important:** `.tf` code never changes. Environment differences are entirely driven by `.tfvars` files.

---

## 6. Variables

### subscription_id
- **Type:** string
- **Default:** `"a97621d8-9158-4681-81b6-38b1222afba4"`
- **Controls:** Azure subscription ID for the azurerm provider
- **Notes:** Can be overridden per environment by editing `.tfvars`

### public_ips
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Controls:** All Azure Public IP addresses to provision
- **Required fields per entry:** name, resource_group_name, location, allocation_method, sku
- **Optional fields:** ip_version (default: "IPv4"), tags
- **Example:**
  ```hcl
  public_ips = {
    "pip_egewg_westeurope_subnet1" = {
      name                = "pip-egewg-westeurope-subnet1"
      resource_group_name = "arunim-test-resource-group"
      location            = "westeurope"
      allocation_method   = "Static"
      sku                 = "Standard"
      ip_version          = "IPv4"
      tags                = {}
    }
  }
  ```

### network_interfaces
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Controls:** All Azure Network Interfaces and their IP configurations
- **Required fields per entry:** name, resource_group_name, location, ip_configurations (list)
- **Optional fields:** enable_accelerated_networking (bool, default: false), ip_forwarding_enabled (bool, default: false), tags
- **ip_configurations list structure:**
  - **Required:** name, private_ip_address_allocation
  - **Optional:** private_ip_address, public_ip_address_id, subnet_id, primary
- **Example:**
  ```hcl
  network_interfaces = {
    "arunim_host_0_nic" = {
      name                          = "arunim-host-0-nic"
      resource_group_name           = "arunim-test-resource-group"
      location                      = "westeurope"
      enable_accelerated_networking = false
      ip_forwarding_enabled         = false
      tags = {
        "cm-resource-parent" = "/subscriptions/.../hostpools/arunim-eu-vd-group"
      }
      ip_configurations = [
        {
          name                          = "ipconfig"
          private_ip_address_allocation = "Static"
          private_ip_address            = "10.100.1.4"
          public_ip_address_id          = "/subscriptions/.../publicIPAddresses/pip-egewg-westeurope-subnet1"
          subnet_id                     = "/subscriptions/.../virtualNetworks/egewg/subnets/subnet1"
          primary                       = true
        }
      ]
    }
  }
  ```

### managed_disks
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Controls:** All Azure Managed Disks
- **Required fields per entry:** name, resource_group_name, location, storage_account_type, create_option
- **Optional fields:** disk_size_gb, os_type, hyper_v_generation, image_reference_id, tags
- **Example:**
  ```hcl
  managed_disks = {
    "arunim_host_0_osdisk" = {
      name                 = "arunim-host-0_osdisk_1_498f48af84094a03a30c1a9efe99c319"
      resource_group_name  = "arunim-test-resource-group"
      location             = "westeurope"
      storage_account_type = "StandardSSD_LRS"
      create_option        = "FromImage"
      disk_size_gb         = 128
      os_type              = "Windows"
      hyper_v_generation   = "V2"
      image_reference_id   = "/Subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/Providers/Microsoft.Compute/Locations/westeurope/Publishers/microsoftwindowsdesktop/ArtifactTypes/VMImage/Offers/windows-10/Skus/win10-22h2-ent-g2/Versions/19045.6456.251117"
      tags = {
        "cm-resource-parent" = "/subscriptions/.../hostpools/arunim-eu-vd-group"
      }
    }
  }
  ```

### virtual_machines
- **Type:** `map(object({...}))`
- **Default:** `{}`
- **Controls:** All Azure Virtual Machines
- **Required fields per entry:** name, resource_group_name, location, vm_size, admin_username, network_interface_keys, os_disk_name, os_disk_caching, os_disk_create_option, image_publisher, image_offer, image_sku, image_version
- **Optional fields:** admin_password (sensitive, default: null), os_disk_managed_disk_type, identity_type, provision_vm_agent (default: true), enable_automatic_upgrades (default: false), boot_diagnostics_enabled (default: false), boot_diagnostics_storage_uri, ultra_ssd_enabled (default: false), tags
- **Note on admin_password:** Marked `sensitive = true` to protect credentials in logs. No value is set in the shipped `.tfvars`. See **Sensitive Variables** section below.
- **network_interface_keys:** A list of keys (strings) from the `network_interfaces` map that this VM should use
- **Example:**
  ```hcl
  virtual_machines = {
    "arunim_host_0" = {
      name                      = "arunim-host-0"
      resource_group_name       = "arunim-test-resource-group"
      location                  = "westeurope"
      vm_size                   = "Standard_D2s_v3"
      admin_username            = "arunim"
      network_interface_keys    = ["arunim_host_0_nic"]
      os_disk_name              = "arunim-host-0_OsDisk_1_498f48af84094a03a30c1a9efe99c319"
      os_disk_caching           = "ReadWrite"
      os_disk_create_option     = "FromImage"
      os_disk_managed_disk_type = "StandardSSD_LRS"
      image_publisher           = "microsoftwindowsdesktop"
      image_offer               = "windows-10"
      image_sku                 = "win10-22h2-ent-g2"
      image_version             = "latest"
      identity_type             = "SystemAssigned"
      provision_vm_agent        = true
      enable_automatic_upgrades = true
      boot_diagnostics_enabled  = true
      tags = {
        "cm-resource-parent" = "/subscriptions/.../hostpools/arunim-eu-vd-group"
      }
    }
  }
  ```

### Sensitive Variables

**admin_password** (in `modules/virtual_machine` context):
- **Type:** string (sensitive)
- **Default:** null
- **Controls:** The Windows admin account password for VMs
- **Status:** NO value is included in the shipped `.tfvars` or any `.auto.tfvars`
- **What you must do:**
  - Create a `secrets.auto.tfvars` file in the working directory with:
    ```hcl
    # secrets.auto.tfvars (add to .gitignore!)
    # No top-level admin_password — it's nested in virtual_machines map
    # Instead, add it as a module-level variable override, or edit sg.tfvars to include it:
    
    virtual_machines = {
      "arunim_host_0" = {
        # ... all other fields from sg.tfvars ...
        admin_password = "YourSecurePasswordHere123!"
      }
    }
    ```
  - OR pass via command line:
    ```bash
    terraform plan -var-file=environments/sg.tfvars \
      -var='virtual_machines={"arunim_host_0"={...admin_password="YourPassword"...}}'
    ```
  - **Important:** Add `secrets.auto.tfvars` to `.gitignore` to prevent accidental commits.

---

## 7. Infrastructure Graph

```
azurerm_public_ip.this (module.public_ip["pip_egewg_westeurope_subnet1"])
│   ip_address: 20.16.176.224
│   allocation_method: Static
└── (referenced by)
    └── azurerm_network_interface.this (module.network_interface["arunim_host_0_nic"])
        │   private_ip: 10.100.1.4
        │   subnet_id: /subscriptions/.../subnets/subnet1
        └── (referenced by)
            └── azurerm_virtual_machine.this (module.virtual_machine["arunim_host_0"])
                │   vm_size: Standard_D2s_v3
                │   admin_username: arunim
                │   os_type: Windows
                │   computer_name: arunim-host-0
                └── (depends on)
                    ├── azurerm_network_interface.this
                    └── azurerm_managed_disk.this (module.managed_disk["arunim_host_0_osdisk"])
                        │   disk_size_gb: 128
                        │   storage_account_type: StandardSSD_LRS
                        │   os_type: Windows
                        └── (attached to VM as storage_os_disk)

Explicit Module Dependencies (in main.tf):
─────────────────────────────────
module.network_interface depends_on module.public_ip
module.virtual_machine depends_on [module.network_interface, module.managed_disk]
```

---

## 8. Notable Decisions & Caveats

### 1. **os_profile ignore_changes**

The `azurerm_virtual_machine.this` resource declares:
```hcl
lifecycle {
  ignore_changes = [os_profile]
}
```

**Reason:** The `os_profile` block contains `admin_password`, which is write-only. Azure's API never returns the password after VM creation, causing perpetual drift if Terraform tries to reconcile it. By ignoring changes to the entire block, we prevent spurious `plan` diffs while still applying the password during creation (if supplied).

### 2. **admin_password Left Null**

No password value is stored in `sg.tfvars` or any checked-in `.auto.tfvars`. The variable is marked `sensitive = true` to redact it from logs if provided.

**Impact:** When `plan` runs without an explicit password, Terraform sees `admin_password = null`, which matches the ignored `os_profile` block, so no diff is raised. If you need to set a password on the VM or reset it, you must provide it via `secrets.auto.tfvars` or `-var` flag.

### 3. **Disk Name Casing**

The managed disk is registered in state with the lowercase name returned by the Azure API:
- **Module key:** `arunim_host_0_osdisk`
- **Disk name in tfvars:** `arunim-host-0_osdisk_1_498f48af84094a03a30c1a9efe99c319` (lowercase `osdisk`)

However, the VM's `storage_os_disk.name` is set to `arunim-host-0_OsDisk_1_498f48af84094a03a30c1a9efe99c319` (title-case `OsDisk`) to match the actual VM disk attachment name. This is not a bug; Azure returns both forms depending on the API endpoint.

### 4. **Image Reference ID for FromImage Disks**

When `create_option = "FromImage"`, the managed disk module requires `image_reference_id` (a full image resource ID), not just the SKU. This ensures the exact image version used during VM creation is recorded:

```
/Subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/Providers/Microsoft.Compute/Locations/westeurope/Publishers/microsoftwindowsdesktop/ArtifactTypes/VMImage/Offers/windows-10/Skus/win10-22h2-ent-g2/Versions/19045.6456.251117
```

### 5. **Hyper-V Generation V2**

The managed disk is created with `hyper_v_generation = "V2"` because the VM runs a Gen2 Windows 10 image. This is required by the provider when creating disks from images.

### 6. **Additional Capabilities Block**

The VM includes an `additional_capabilities` block with `ultra_ssd_enabled = false` (the default). This is necessary for provider validation, even though the value matches the default.

### 7. **Boot Diagnostics**

`boot_diagnostics_enabled = true` with `boot_diagnostics_storage_uri = ""` (empty string).

- **Empty string:** Tells Azure to use the managed storage account for boot diagnostics (no explicit URI needed).
- **Discovered value:** The API returned `null`, but Terraform provider requires an empty string.
- **Reconciliation:** The config uses `""` (empty string), which matches the live state after normalization.

### 8. **Explicit Module Dependencies**

- `module.network_interface` explicitly depends on `module.public_ip` to ensure public IPs are created before NICs attempt to reference them.
- `module.virtual_machine` explicitly depends on both `module.network_interface` and `module.managed_disk` to enforce creation order.

These dependencies could rely on implicit graph resolution (via resource references), but are explicit for clarity and robustness.

### 9. **Providers File**

The `providers.tf` was initially empty in the pre-generated code. We added:
```hcl
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
```
to enable provider configuration.

### 10. **No Root-Level Enumerated Outputs**

The `outputs.tf` is empty except for a comment. This avoids the "stale null trap" with `for_each` maps: if a key is removed from the input map, root-level outputs referencing that key would become null, potentially breaking downstream modules or data sources. Callers can retrieve outputs from individual modules directly (e.g., `module.virtual_machine["arunim_host_0"].id`).

### 11. **Resource Status: Unmanaged → Imported**

All four discovered resources were marked `resource_status: unmanaged` in the discovery output, meaning they existed in Azure but were not in Terraform state. The `imports.sh` script changed their status to **managed** (state imported), and `plan` now shows 0/0/0 (no changes).

---

## Summary

This Terraform configuration is a lightweight, modular IaC representation of a single Windows 10 Enterprise Gen2 VM in Azure, intended for use as an Azure Virtual Desktop session host. All resources have been imported into state and reconciled. The code is environment-agnostic: manage development, staging, and production by creating `.tfvars` variants and passing them to `plan` and `apply`. No `.tf` code changes are required to switch environments.
