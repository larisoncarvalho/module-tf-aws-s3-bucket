#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.role_assignment.azurerm_role_assignment.this' '/providers/Microsoft.Authorization/roleAssignments/1bb730a7-e678-46e3-b447-f8787ec2d6a5'