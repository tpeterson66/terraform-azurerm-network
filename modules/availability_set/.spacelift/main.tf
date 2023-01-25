provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-modules"
  location = "EastUS"
}

# // availability set
module "availability_set" {
  source                       = "../"
  name                         = "spacelift-availability-set"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 5

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
