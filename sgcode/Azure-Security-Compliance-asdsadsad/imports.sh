#!/bin/sh
set -e

"$1" import -var-file environments/sg.tfvars 'module.policy_assignment["asc_default"].azurerm_subscription_policy_assignment.this' '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/policyAssignments/SecurityCenterBuiltIn'
"$1" import -var-file environments/sg.tfvars 'module.role_assignment["672a8b9c"].azurerm_role_assignment.this' '/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleAssignments/672a8b9c-068d-48b6-8528-8df74234e662'
