provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-modules-natgateway"
  location = "EastUS"
}

# // NAT gateway
module "nat_gateway" {
  source                       = "../"
  name                         = "spacelift-nat-gateway"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // NAT gateway specific
module "nat_gateway_specific" {
  source                       = "../"
  name                         = "spacelift-nat-gateway-specific"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  sku_name                     = "Standard"
  idle_timeout_in_minutes      = "5"
  zones                        = ["1"]

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}