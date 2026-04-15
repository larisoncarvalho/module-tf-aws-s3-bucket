resource "azurerm_resource_group" "this" {
  for_each = var.resource_groups

  location = each.value.location
  name     = each.key
  tags     = each.value.tags
}