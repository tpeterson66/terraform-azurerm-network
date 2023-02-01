provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-static"
  location = "EastUS2"
}

// Static site
module "static_site" {
  source              = "../"
  name                = "spacelift-static-site"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  sku_tier = "Standard"
  sku_size = "Standard"
  # identity_type = "UserAssigned"
  # user_assigned_identities = ["/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-static-site/providers/Microsoft.ManagedIdentity/userAssignedIdentities/spacelift-test-user-assigned-managed-identity"]
}  

