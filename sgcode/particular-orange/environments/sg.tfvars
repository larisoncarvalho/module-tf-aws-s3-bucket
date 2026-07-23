region = "eastus"

storage_accounts = {
  bloblogging = {
    instance_index      = 1
    resource_group_name = "networkwatcherrg"
    custom_name         = "bloblogging"
    account_kind        = "StorageV2"
    skuname             = "Standard_LRS"
    access_tier         = "Hot"
    is_hns_enabled      = false
    containers_list     = []
    custom_tags         = {}
  }
  autoscalersgrunnsfhb4vyt = {
    instance_index      = 2
    resource_group_name = "adis-eu"
    custom_name         = "autoscalersgrunnsfhb4vyt"
    account_kind        = "StorageV2"
    skuname             = "Standard_LRS"
    access_tier         = "Hot"
    is_hns_enabled      = false
    containers_list = [
      { name = "autoscaler-state", access_type = "private" },
      { name = "deployments", access_type = "private" }
    ]
    custom_tags = {
      purpose = "stackguardian-private-runner"
      prefix  = "SG_RUNNER"
      Name    = "autoscalersgrunnsfhb4vyt"
    }
  }
  stgbackendsgrunnnz6ztbrv = {
    instance_index      = 3
    resource_group_name = "adis-eu"
    custom_name         = "stgbackendsgrunnnz6ztbrv"
    account_kind        = "StorageV2"
    skuname             = "Standard_LRS"
    access_tier         = "Hot"
    is_hns_enabled      = false
    containers_list = [
      { name = "runner", access_type = "private" },
      { name = "system", access_type = "private" }
    ]
    custom_tags = {
      purpose = "stackguardian-private-runner"
      prefix  = "SG_RUNNER"
    }
  }
  romedocspipeline = {
    instance_index      = 4
    resource_group_name = "arunim-test-resource-group"
    custom_name         = "romedocspipeline"
    account_kind        = "StorageV2"
    skuname             = "Standard_LRS"
    access_tier         = "Hot"
    is_hns_enabled      = false
    containers_list = [
      { name = "docs", access_type = "blob" }
    ]
    custom_tags = {}
  }
  autoscaleprivaterunbe10 = {
    instance_index      = 5
    resource_group_name = "autoscale-private-runner_group-bd75"
    custom_name         = "autoscaleprivaterunbe10"
    account_kind        = "Storage"
    skuname             = "Standard_LRS"
    access_tier         = "Hot"
    is_hns_enabled      = false
    containers_list = [
      { name = "azure-webjobs-hosts", access_type = "private" },
      { name = "azure-webjobs-secrets", access_type = "private" },
      { name = "scm-releases", access_type = "private" }
    ]
    custom_tags = {}
  }
}