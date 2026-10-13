subscription_id = "618c8e34-b87b-44e8-bb3a-b2de95df60ed"

role_definitions = {
  "azure_kubernetes_fleet_manager_rbac_cluster_writer" = {
    role_name         = "Azure Kubernetes Fleet Manager RBAC Cluster Writer"
    scope             = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed"
    description       = "Grants read/write access to most Kubernetes cluster-scoped resources in the fleet-managed hub cluster."
    assignable_scopes = ["/"]
    permissions = [
      {
        actions = [
          "Microsoft.ContainerService/fleets/read",
          "Microsoft.ContainerService/fleets/listCredentials/action"
        ]
        not_actions = []
        data_actions = [
          "Microsoft.ContainerService/fleets/apiextensions.k8s.io/customresourcedefinitions/read",
          "Microsoft.ContainerService/fleets/apps/controllerrevisions/read",
          "Microsoft.ContainerService/fleets/apps/daemonsets/read",
          "Microsoft.ContainerService/fleets/apps/daemonsets/write",
          "Microsoft.ContainerService/fleets/apps/deployments/read",
          "Microsoft.ContainerService/fleets/apps/deployments/write",
          "Microsoft.ContainerService/fleets/apps/statefulsets/read",
          "Microsoft.ContainerService/fleets/apps/statefulsets/write",
          "Microsoft.ContainerService/fleets/autoscaling/horizontalpodautoscalers/read",
          "Microsoft.ContainerService/fleets/autoscaling/horizontalpodautoscalers/write",
          "Microsoft.ContainerService/fleets/batch/cronjobs/read",
          "Microsoft.ContainerService/fleets/batch/cronjobs/write",
          "Microsoft.ContainerService/fleets/batch/jobs/read",
          "Microsoft.ContainerService/fleets/batch/jobs/write",
          "Microsoft.ContainerService/fleets/cluster.kubernetes-fleet.io/memberclusters/read",
          "Microsoft.ContainerService/fleets/cluster.kubernetes-fleet.io/memberclusters/write",
          "Microsoft.ContainerService/fleets/configmaps/read",
          "Microsoft.ContainerService/fleets/configmaps/write",
          "Microsoft.ContainerService/fleets/endpoints/read",
          "Microsoft.ContainerService/fleets/endpoints/write",
          "Microsoft.ContainerService/fleets/events.k8s.io/events/read",
          "Microsoft.ContainerService/fleets/events/read",
          "Microsoft.ContainerService/fleets/extensions/daemonsets/read",
          "Microsoft.ContainerService/fleets/extensions/daemonsets/write",
          "Microsoft.ContainerService/fleets/extensions/deployments/read",
          "Microsoft.ContainerService/fleets/extensions/deployments/write",
          "Microsoft.ContainerService/fleets/extensions/ingresses/read",
          "Microsoft.ContainerService/fleets/extensions/ingresses/write",
          "Microsoft.ContainerService/fleets/extensions/networkpolicies/read",
          "Microsoft.ContainerService/fleets/extensions/networkpolicies/write",
          "Microsoft.ContainerService/fleets/limitranges/read",
          "Microsoft.ContainerService/fleets/namespaces/read",
          "Microsoft.ContainerService/fleets/networking.k8s.io/ingresses/read",
          "Microsoft.ContainerService/fleets/networking.k8s.io/ingresses/write",
          "Microsoft.ContainerService/fleets/networking.k8s.io/networkpolicies/read",
          "Microsoft.ContainerService/fleets/networking.k8s.io/networkpolicies/write",
          "Microsoft.ContainerService/fleets/nodes/read",
          "Microsoft.ContainerService/fleets/nodes/write",
          "Microsoft.ContainerService/fleets/persistentvolumeclaims/read",
          "Microsoft.ContainerService/fleets/persistentvolumeclaims/write",
          "Microsoft.ContainerService/fleets/persistentvolumes/read",
          "Microsoft.ContainerService/fleets/persistentvolumes/write",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourcebindings/read",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourceoverrides/read",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourceoverrides/write",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourceoverridesnapshots/read",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourceplacements/read",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourceplacements/write",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterresourcesnapshots/read",
          "Microsoft.ContainerService/fleets/placement.kubernetes-fleet.io/clusterschedulingpolicysnapshots/read",
          "Microsoft.ContainerService/fleets/policy/poddisruptionbudgets/read",
          "Microsoft.ContainerService/fleets/policy/poddisruptionbudgets/write",
          "Microsoft.ContainerService/fleets/replicationcontrollers/read",
          "Microsoft.ContainerService/fleets/replicationcontrollers/write",
          "Microsoft.ContainerService/fleets/resourcequotas/read",
          "Microsoft.ContainerService/fleets/secrets/read",
          "Microsoft.ContainerService/fleets/secrets/write",
          "Microsoft.ContainerService/fleets/serviceaccounts/read",
          "Microsoft.ContainerService/fleets/serviceaccounts/write",
          "Microsoft.ContainerService/fleets/services/read",
          "Microsoft.ContainerService/fleets/services/write"
        ]
        not_data_actions = []
      }
    ]
  }
  "azure_local_migrate_execute_expert" = {
    role_name         = "Azure Local Migrate Execute Expert"
    scope             = "/subscriptions/618c8e34-b87b-44e8-bb3a-b2de95df60ed"
    description       = "Grants restricted access on an Azure Local based Azure Migrate project to only perform migration related operations, including replication, execution of migrations, tracking and monitoring of migration progress, and initiation of agentless migrations."
    assignable_scopes = ["/"]
    permissions = [
      {
        actions = [
          "Microsoft.Resources/subscriptions/resourceGroups/read",
          "Microsoft.Resources/subscriptions/read",
          "Microsoft.Resources/deployments/*",
          "Microsoft.Resources/subscriptions/resourceGroups/write",
          "Microsoft.Resources/subscriptions/locations/read",
          "Microsoft.Resources/checkResourceName/action",
          "Microsoft.Resources/deployments/validate/action",
          "Microsoft.Resources/deploymentScripts/write",
          "Microsoft.Resources/deploymentScripts/read",
          "Microsoft.Resources/links/write",
          "Microsoft.Authorization/*/read",
          "Microsoft.Authorization/locks/write",
          "Microsoft.Authorization/locks/delete",
          "Microsoft.Insights/alertRules/*",
          "Microsoft.Migrate/*/read",
          "Microsoft.Migrate/migrateProjects/taskSummary/action",
          "Microsoft.ApplicationMigration/*/read",
          "Microsoft.OffAzure/*/read",
          "Microsoft.MySQLDiscovery/*/read",
          "Microsoft.Support/*",
          "Microsoft.Storage/storageAccounts/*/read",
          "Microsoft.Storage/storageAccounts/*/write",
          "Microsoft.Storage/storageAccounts/listKeys/action",
          "Microsoft.Resources/links/read",
          "Microsoft.DependencyMap/*/read",
          "Microsoft.DependencyMap/maps/*/action",
          "Microsoft.AzureStackHCI/*/Read",
          "Microsoft.AzureStackHCI/LogicalNetworks/join/action",
          "Microsoft.AzureStackHCI/NetworkInterfaces/*",
          "Microsoft.AzureStackHCI/VirtualHardDisks/*",
          "Microsoft.AzureStackHCI/VirtualMachines/Write",
          "Microsoft.AzureStackHCI/VirtualMachineInstances/Write",
          "Microsoft.DataReplication/*/read",
          "Microsoft.DataReplication/replicationVaults/protectedItems/*",
          "Microsoft.DataReplication/replicationVaults/replicationExtensions/*",
          "Microsoft.DataReplication/replicationVaults/replicationPolicies/*",
          "Microsoft.ExtendedLocation/customLocations/read",
          "Microsoft.KubernetesConfiguration/extensions/read",
          "Microsoft.ResourceConnector/appliances/read"
        ]
        not_actions = [
          "Microsoft.OffAzure/hypervSites/machines/inventoryinsights/pendingupdates/*",
          "Microsoft.OffAzure/hypervSites/machines/inventoryinsights/vulnerabilities/*",
          "Microsoft.OffAzure/serverSites/machines/inventoryinsights/pendingupdates/*",
          "Microsoft.OffAzure/serverSites/machines/inventoryinsights/vulnerabilities/*",
          "Microsoft.OffAzure/vmwareSites/machines/inventoryinsights/vulnerabilities/*",
          "Microsoft.OffAzure/vmwareSites/machines/inventoryinsights/pendingupdates/*"
        ]
      },
      {
        actions = [
          "Microsoft.Authorization/roleAssignments/write",
          "Microsoft.Authorization/roleAssignments/delete"
        ]
        not_actions = []
      }
    ]
  }
}
