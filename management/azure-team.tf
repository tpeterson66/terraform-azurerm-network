# azure team - used to manage the lab environments
resource "spacelift_space" "azure_team" {
  name             = "smartcloud-demo"
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
}

resource "spacelift_azure_integration_attachment" "azure_designer" {
  integration_id  = data.spacelift_azure_integration.smartcloud.id
  stack_id        = spacelift_stack.azure_designer.id
  write           = true
  read            = true
  subscription_id = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
}