provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-route-table"
  location = "EastUS"
}

// route table
module "route_table" {
  source              = "../"
  name                = "spacelift-test-standard-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

// route w/ routes
module "route_table_routes" {
  source              = "../"
  name                = "spacelift-test-standard-route-table-routes"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  routes = [{
    name                   = "vNetLocal"
    address_prefix         = "10.10.1.0/24"
    next_hop_type          = "VnetLocal"
    next_hop_in_ip_address = null
    }, {
    name                   = "Internet"
    address_prefix         = "1.2.3.4/32"
    next_hop_type          = "Internet"
    next_hop_in_ip_address = null
    }, {
    name                   = "VirtualAppliance"
    address_prefix         = "4.5.6.7/32"
    next_hop_type          = "VirtualAppliance"
    next_hop_in_ip_address = "10.20.30.40"
    }, {
    name                   = "Blackhole"
    address_prefix         = "8.8.8.8/32"
    next_hop_type          = "None"
    next_hop_in_ip_address = null
  }]
}