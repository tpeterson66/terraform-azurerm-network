provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-modules-nsg"
  location = "EastUS"
}

# // network security group
module "network_security_group" {
  source                       = "../"
  name                         = "spacelift-nsg"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // network security group specific
module "network_security_group_specific" {
  source                       = "../"
  name                         = "spacelift-nsg-specific"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  security_rules = [{
    name                       = "spacelift-test-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }]
}