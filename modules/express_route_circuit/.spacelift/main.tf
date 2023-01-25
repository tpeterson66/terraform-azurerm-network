provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-expressroute1"
  location = "EastUS"
}

# // express route circuit
module "express_route_circuit" {
  source                        = "../"
  name                          = "spacelift-expressroute"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  service_provider_name         = "Equinix"
  peering_location              = "Silicon Valley"
  bandwidth_in_gbps             = "1"
  bandwidth_in_mbps             = "50"
  sku_tier                      = "Standard"
  port_name                     = "test"
  encapsulation                 = "Dot1Q"
  vlan_id                       = 300
  peer_asn                      = 100
  primary_peer_address_prefix   = "123.0.0.0/30"
  secondary_peer_address_prefix = "123.0.0.4/30"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // express route circuit specific
module "express_route_circuit_specific" {
  source                        = "../"
  name                          = "spacelift-expressroute-specific"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  service_provider_name         = "Equinix"
  peering_location              = "Silicon Valley"
  bandwidth_in_gbps             = "1"
  bandwidth_in_mbps             = "50"
  sku_tier                      = "Standard"
  port_name                     = "test"
  encapsulation                 = "Dot1Q"
  vlan_id                       = 300
  peer_asn                      = 100
  primary_peer_address_prefix   = "123.0.0.0/30"
  secondary_peer_address_prefix = "123.0.0.4/30"
  peering_type                  = "AzurePrivatePeering"
  ipv4_enabled                  = true
  sku_family                    = "MeteredData"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}