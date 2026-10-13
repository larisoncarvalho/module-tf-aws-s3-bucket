#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars 'module.role_definition["azure_kubernetes_fleet_manager_rbac_cluster_writer"].azurerm_role_definition.this' '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/1dc4cd5a-de51-4ee4-bc8e-b40e9c17e320|/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed'
"$1" import -var-file environments/sg.tfvars 'module.role_definition["azure_local_migrate_execute_expert"].azurerm_role_definition.this' '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/1cfa4eac-9a23-481c-a793-bfb6958e836c|/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed'
