#!/bin/sh
set -e

terraform import 'module.key_vault_administrator.azurerm_role_definition.this' '00482a5a-887f-4fb3-b363-3b7fe8e74483'