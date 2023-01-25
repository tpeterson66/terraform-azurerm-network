provider "azurerm" {
  features {}
}

# // bastion
module "bastion" {
  source                       = "../"
  name                         = "spacelift-bastion"
  location                     = "EastUS 2"
  resource_group_name          = "spacelift-test-modules"
  public_ip_name               = "spacelift-bastion-publicip"
  subnet_id                    = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/AzureBastionSubnet"
  ip_configuration_name        = "spacelift-ipconfig-name"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // bastion custom
module "bastion_custom" {
  source                       = "../"
  name                         = "spacelift-bastion-custom"
  location                     = "EastUS 2"
  resource_group_name          = "spacelift-test-modules"
  public_ip_name               = "spacelift-bastion-publicip"
  subnet_id                    = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/AzureBastionSubnet"
  ip_configuration_name        = "spacelift-ipconfig-name"
  allocation_method            = "Dynamic"
  sku                          = "Basic" 
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}