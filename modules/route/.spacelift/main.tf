provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-route"
  location = "EastUS"
}
# // route table
module "route_table" {
  source              = "./modules/route_table/"
  name                = "spacelift-test-standard-route-table"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // route
module "routes" {
  source                 = "../"
  name                   = "spacelift-testroute"
  resource_group_name    = azurerm_resource_group.rg.name
  route_table_name       = module.route_table.name
  address_prefix         = "10.1.0.0/16"
  next_hop_type          = "VnetLocal"
  next_hop_in_ip_address = null
}

# // route virtual appliance
module "routes_virtualappliance" {
  source                 = "../"
  name                   = "spacelift-testroute1"
  resource_group_name    = azurerm_resource_group.rg.name
  route_table_name       = module.route_table.name
  address_prefix         = "4.5.6.7/32"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = "10.20.30.40"

}