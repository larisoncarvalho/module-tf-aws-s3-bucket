module "public_ip" {
  source   = "./modules/public_ip"
  for_each = var.public_ips

  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
  ip_version          = each.value.ip_version
  tags                = each.value.tags
}

module "network_interface" {
  source   = "./modules/network_interface"
  for_each = var.network_interfaces

  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  location                      = each.value.location
  ip_configurations             = each.value.ip_configurations
  enable_accelerated_networking = each.value.enable_accelerated_networking
  ip_forwarding_enabled         = each.value.ip_forwarding_enabled
  tags                          = each.value.tags

  depends_on = [module.public_ip]
}

module "managed_disk" {
  source   = "./modules/managed_disk"
  for_each = var.managed_disks

  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  location             = each.value.location
  storage_account_type = each.value.storage_account_type
  create_option        = each.value.create_option
  disk_size_gb         = each.value.disk_size_gb
  os_type              = each.value.os_type
  hyper_v_generation   = each.value.hyper_v_generation
  image_reference_id   = each.value.image_reference_id
  tags                 = each.value.tags
}

module "virtual_machine" {
  source   = "./modules/virtual_machine"
  for_each = var.virtual_machines

  name                         = each.value.name
  resource_group_name          = each.value.resource_group_name
  location                     = each.value.location
  vm_size                      = each.value.vm_size
  admin_username               = each.value.admin_username
  admin_password               = each.value.admin_password
  network_interface_ids        = [for nic_key in each.value.network_interface_keys : module.network_interface[nic_key].id]
  os_disk_name                 = each.value.os_disk_name
  os_disk_caching              = each.value.os_disk_caching
  os_disk_create_option        = each.value.os_disk_create_option
  os_disk_managed_disk_type    = each.value.os_disk_managed_disk_type
  image_publisher              = each.value.image_publisher
  image_offer                  = each.value.image_offer
  image_sku                    = each.value.image_sku
  image_version                = each.value.image_version
  identity_type                = each.value.identity_type
  provision_vm_agent           = each.value.provision_vm_agent
  enable_automatic_upgrades    = each.value.enable_automatic_upgrades
  boot_diagnostics_enabled     = each.value.boot_diagnostics_enabled
  boot_diagnostics_storage_uri = each.value.boot_diagnostics_storage_uri
  ultra_ssd_enabled            = each.value.ultra_ssd_enabled
  tags                         = each.value.tags

  depends_on = [module.network_interface, module.managed_disk]
}
