variable "region" {
  description = "The Azure region to deploy resources into."
  type        = string
}

variable "storage_accounts" {
  description = "Map of storage account configurations."
  type = map(object({
    instance_index      = number
    resource_group_name = string
    custom_name         = string
    account_kind        = string
    skuname             = string
    access_tier         = string
    is_hns_enabled      = bool
    containers_list = list(object({
      name        = string
      access_type = string
    }))
    custom_tags = map(string)
  }))
}