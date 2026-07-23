module "key_vault_administrator" {
  source = "./modules/role_definition"

  role_definition_id = "00482a5a-887f-4fb3-b363-3b7fe8e74483"
  role_name          = "Key Vault Administrator"
  scope              = "/"
  description        = "Perform all data plane operations on a key vault and all objects in it, including certificates, keys, and secrets. Cannot manage key vault resources or manage role assignments. Only works for key vaults that use the 'Azure role-based access control' permission model."
  actions = [
    "Microsoft.Authorization/*/read",
    "Microsoft.Insights/alertRules/*",
    "Microsoft.Resources/deployments/*",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Support/*",
    "Microsoft.KeyVault/checkNameAvailability/read",
    "Microsoft.KeyVault/deletedVaults/read",
    "Microsoft.KeyVault/locations/*/read",
    "Microsoft.KeyVault/vaults/*/read",
    "Microsoft.KeyVault/operations/read"
  ]
  assignable_scopes = ["/"]
}