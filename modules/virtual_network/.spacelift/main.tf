provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-virtualmachine"
  location = "EastUS"
}

# // virtual network
module "virtual_network" {
  source              = "../"
  name                = "spacelift-virtualnetwork"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  ddos_id             = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/ddosProtectionPlans/spacelift-ddos"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // virtual network dns
module "virtual_network_dns" {
  source              = "../"
  name                = "spacelift-virtualnetworkdns"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  ddos_id             = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/ddosProtectionPlans/spacelift-ddos"

  settings = [{
    dns_servers = ["10.0.0.5", "10.0.0.6"]
  }]

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}