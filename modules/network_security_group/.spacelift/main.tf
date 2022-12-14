provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-nsg"
  location = "EastUS"
}

// network security group
module "network_security_group" {
  source              = "../"
  name                = "spacelift-test-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

// network security group w/ rules
module "network_security_group_with_rules" {
  source              = "../"
  name                = "spacelift-test-standard-nsg-rules"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  routes = [{
    name = "testrule1"
    priority = "100"
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    source_address_prefix = "10.10.10.0/24"
    destination_port_range = "80"
    destination_address_prefix = "0.0.0.0/0"
  }]
}