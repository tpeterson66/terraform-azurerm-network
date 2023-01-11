provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-portaldashboard"
  location = "EastUS"
}

# // portal dashboard
module "portal_dashboard" {
  source                       = "../"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  dashboards = [{
    name      = "spacelift-portaldashboard"
    tpl_file  = "../azure_resource_inventory.tpl"
    variables = {}
  }]

}
