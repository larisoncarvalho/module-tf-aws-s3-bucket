module "storage_accounts" {
  for_each = var.storage_accounts
  source   = "git::https://github.com/WeAreRetail/terraform-azurerm-storage-account.git?ref=master"

  instance_index      = each.value.instance_index
  resource_group_name = each.value.resource_group_name
  custom_name         = each.value.custom_name
  account_kind        = each.value.account_kind
  skuname             = each.value.skuname
  access_tier         = each.value.access_tier
  is_hns_enabled      = each.value.is_hns_enabled
  containers_list     = each.value.containers_list
  custom_tags         = each.value.custom_tags
}