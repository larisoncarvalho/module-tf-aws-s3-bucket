role_definition_id = "00482a5a-887f-4fb3-b363-3b7fe8e74483"

name = "Key Vault Administrator"

scope = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed"

description = "Perform all data plane operations on a key vault and all objects in it, including certificates, keys, and secrets. Cannot manage key vault resources or manage role assignments. Only works for key vaults that use the 'Azure role-based access control' permission model."

assignable_scopes = [
  "/"
]

permissions_actions = [
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

permissions_data_actions = [
  "Microsoft.KeyVault/vaults/*"
]