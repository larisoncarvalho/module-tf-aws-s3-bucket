subscription_id = "618c8e34-b87b-44e8-bb3a-b2de95df60ed"

policy_assignments = {
  "asc_default" = {
    name                 = "SecurityCenterBuiltIn"
    subscription_id      = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed"
    policy_definition_id = "/providers/Microsoft.Authorization/policySetDefinitions/1f3afdf9-d0c9-4c3d-847f-89da613e70a8"
    description          = "This is the default set of policies monitored by Azure Security Center. It was automatically assigned as part of onboarding to Security Center. The default assignment contains only audit policies. For more information please visit https://aka.ms/ascpolicies"
    display_name         = "ASC Default (subscription: 618c8e34-b87b-44e8-bb3a-b2de95df60ed)"
    parameters           = "{}"
  }
}

role_assignments = {
  "672a8b9c" = {
    scope              = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed"
    role_definition_id = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed/providers/Microsoft.Authorization/roleDefinitions/b24988ac-6180-42a0-ab88-20f7382dd24c"
    principal_id       = "491f87f3-3dfc-41e0-bd93-df088ede8f8b"
    principal_type     = "User"
    name               = "672a8b9c-068d-48b6-8528-8df74234e662"
  }
}
