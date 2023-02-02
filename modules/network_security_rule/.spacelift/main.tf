provider "azurerm" {
  features {}
}

# // network security rule
module "network_security_rule" {
  source                      = "../"
  name                        = "spacelift-network-security-rule"
  location                    = "EastUS"
  resource_group_name         = "spacelift-test-modules"
  network_security_group_name = "spacelift-test-nsg"
  priority                    = "100"
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
}

# // network security rule with specific values
module "network_security_rule_specific" {
  source                      = "../"
  name                        = "spacelift-network-security-rule-specific"
  location                    = "EastUS"
  resource_group_name         = "spacelift-test-modules"
  network_security_group_name = "spacelift-test-nsg"
  priority                    = "102"
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "8080"
  destination_port_range      = "8080"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = "VirtualNetwork"
}