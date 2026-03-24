#!/bin/sh
set -e

tofu1.11.2 import -var-file environments/terraform.tfvars module.backup_operator.azurerm_role_definition.this 00c29273-979b-4161-815c-10b084fb9324