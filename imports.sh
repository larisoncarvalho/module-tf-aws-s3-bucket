#!/bin/sh
set -e
"$1" import -var-file environments/sg.tfvars \
  'module.role_assignment["cc5164f7_d0bc_4f5f_9d12_93baeb747642"].azurerm_role_assignment.this' \
  '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleAssignments/cc5164f7-d0bc-4f5f-9d12-93baeb747642'
