provider "azurerm" {
  features {}
}

# // Private link
module "private_link" {
  source              = "../"
  name                = "spacelift-private-link"
  location            = "East US 2"
  resource_group_name = "spacelift-test-modules"
  subnet_id           = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet/subnets/default"
  public_ip_name      = "spacelift-publicip-test1"
  lb_name             = "spacelift-lb-test1"
  primary             = true
}

# // Private link custom
module "private_link_custom" {
  source              = "../"
  name                = "spacelift-private-link-custom"
  location            = "East US 2"
  resource_group_name = "spacelift-test-modules"
  subnet_id           = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/default"
  public_ip_name      = "spacelift-publicip-custom"
  lb_name             = "spacelift-lb-custom"
  primary             = true
  allocation_method   = "Dynamic"
}

