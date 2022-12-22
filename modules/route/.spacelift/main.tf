provider "azurerm" {
  features {}
}

# // route
module "routes" {
  source                 = "../"
  name                   = "spacelift-testroute"
  location               = "East US"
  resource_group_name    = "spacelift-testing"
  route_table_name       = "spacelift-testroute"
  address_prefix         = "10.1.0.0/16"
  next_hop_type          = "VnetLocal"
  next_hop_in_ip_address = null
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // route virtual appliance
module "routes_virtualappliance" {
  source                 = "../"
  name                   = "spacelift-testroute1"
  location               = "East US"
  resource_group_name    = "spacelift-testing"
  route_table_name       = "spacelift-testroute"
  address_prefix         = "4.5.6.7/32"
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = "10.20.30.40"
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}