resource "azurerm_managed_disk" "this" {
  name                 = var.name
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_account_type = var.storage_account_type
  create_option        = var.create_option
  disk_size_gb         = var.disk_size_gb
  os_type              = var.os_type
  hyper_v_generation   = var.hyper_v_generation
  image_reference_id   = var.image_reference_id
  tags                 = var.tags
}
