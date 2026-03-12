variable "key_vault_administrator" {
  description = "Configuration for Key Vault Administrator role definition"
  type = object({
    role_name         = string
    scope             = string
    description       = string
    actions           = list(string)
    assignable_scopes = list(string)
  })
}