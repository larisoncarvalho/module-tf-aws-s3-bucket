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

network_interfaces = {
  "arunim_host_0_nic" = {
    name                          = "arunim-host-0-nic"
    resource_group_name           = "arunim-test-resource-group"
    location                      = "westeurope"
    enable_accelerated_networking = false
    ip_forwarding_enabled         = false
    tags = {
      "cm-resource-parent" = "/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourcegroups/arunim-test-resource-group/providers/Microsoft.DesktopVirtualization/hostpools/arunim-eu-vd-group"
    }
    ip_configurations = [
      {
        name                          = "ipconfig"
        private_ip_address_allocation = "Static"
        private_ip_address            = "10.100.1.4"
        public_ip_address_id          = "/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.Network/publicIPAddresses/pip-egewg-westeurope-subnet1"
        subnet_id                     = "/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/dsgsdg/providers/Microsoft.Network/virtualNetworks/egewg/subnets/subnet1"
        primary                       = true
      }
    ]
  }
}

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
      "cm-resource-parent" = "/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.DesktopVirtualization/hostpools/arunim-eu-vd-group"
    }
  }
}

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
      "cm-resource-parent" = "/subscriptions/a97621d8-9158-4681-81b6-38b1222afba4/resourceGroups/arunim-test-resource-group/providers/Microsoft.DesktopVirtualization/hostpools/arunim-eu-vd-group"
    }
  }
}
