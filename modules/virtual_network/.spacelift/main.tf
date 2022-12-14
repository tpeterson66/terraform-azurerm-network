provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-route-table"
  location = "EastUS"
}

// virtual network
module "route_table" {
  source              = "../"
  name                = "spacelift-test-virtual_network"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  address_space = ["10.10.0.0/23"]
}