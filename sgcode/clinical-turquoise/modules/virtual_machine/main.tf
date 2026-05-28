resource "azurerm_virtual_machine" "this" {
  location              = var.location
  name                  = var.vm_name
  network_interface_ids = [var.network_interface_id]
  resource_group_name   = var.resource_group_name
  vm_size               = var.vm_size
  zones                 = var.zones

  storage_os_disk {
    name              = var.os_disk_name
    create_option     = var.os_disk_create_option
    caching           = var.os_disk_caching
    os_type           = var.os_type
    managed_disk_type = var.os_disk_managed_disk_type
  }

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_profile {
    computer_name  = var.computer_name
    admin_username = var.admin_username
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication

    dynamic "ssh_keys" {
      for_each = var.ssh_key_data != null ? [1] : []
      content {
        path     = var.ssh_key_path
        key_data = var.ssh_key_data
      }
    }
  }

  boot_diagnostics {
    enabled     = var.boot_diagnostics_enabled
    storage_uri = var.boot_diagnostics_storage_uri
  }

  additional_capabilities {}
}