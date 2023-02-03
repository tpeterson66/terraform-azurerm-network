# azure team - used to manage the lab environments
resource "spacelift_space" "smartcloud" {
  name             = "smartcloud"
  parent_space_id  = spacelift_space.coretek.id
  inherit_entities = true
}

## SmartCloud Dev
resource "spacelift_stack" "smartcloud_dev" {
  github_enterprise {
    namespace = "tpeterson66" # The GitHub organization / user the repository belongs to
  }

  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Smartcloud dev management"
  name              = "Smartcloud Dev"
  project_root      = "smartcloud/dev"
  repository        = "terraform-azurerm-network"
  terraform_version = "1.3.7"
  labels = [ "infracost" ]
  space_id = spacelift_space.smartcloud.id
  worker_pool_id = data.spacelift_worker_pool.smartcloud.id
}

resource "spacelift_azure_integration_attachment" "smartcloud_dev" {
  integration_id  = data.spacelift_azure_integration.smartcloud.id
  stack_id        = spacelift_stack.smartcloud_dev.id
  write           = true
  read            = true
  subscription_id = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
}

## Azure Designer
resource "spacelift_stack" "azure_designer" {
  github_enterprise {
    namespace = "tpeterson66" # The GitHub organization / user the repository belongs to
  }
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "Smartcloud dev management"
  name              = "Azure Designer"
  project_root      = "smartcloud/azureDesigner"
  repository        = "terraform-azurerm-network"
  terraform_version = "1.3.7"
  labels = [ "infracost" ]
  space_id = spacelift_space.smartcloud.id
  worker_pool_id = data.spacelift_worker_pool.smartcloud.id
}

resource "spacelift_azure_integration_attachment" "azure_designer" {
  integration_id  = data.spacelift_azure_integration.smartcloud.id
  stack_id        = spacelift_stack.azure_designer.id
  write           = true
  read            = true
  subscription_id = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
}


## Spacelift Private Worker Pool
resource "spacelift_stack" "spacelift_private_worker" {
  github_enterprise {
    namespace = "tpeterson66" # The GitHub organization / user the repository belongs to
  }
  administrative    = false
  autodeploy        = true
  branch            = "main"
  description       = "SmartCloud Spacelift Private Worker"
  name              = "SmartCloud Spacelift Private Worker"
  project_root      = "smartcloud/private-worker-pool"
  repository        = "terraform-azurerm-network"
  terraform_version = "1.3.7"
  labels = [ "infracost" ]
  space_id = spacelift_space.smartcloud.id
  worker_pool_id = data.spacelift_worker_pool.smartcloud.id
}

resource "spacelift_azure_integration_attachment" "spacelift_private_worker" {
  integration_id  = data.spacelift_azure_integration.smartcloud.id
  stack_id        = spacelift_stack.spacelift_private_worker.id
  write           = true
  read            = true
  subscription_id = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
}