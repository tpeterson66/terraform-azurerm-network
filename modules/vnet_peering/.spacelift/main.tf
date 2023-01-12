provider "azurerm" {
  features {}
}

# // vnet peering
module "vnet_peering" {
  source                                = "../"
  name                                  = "spacelift-vnetpeer"
  name_back                             = "spacelift-vnetpeerback"  
  virtual_network_1_resource_group_name = "spacelift-test-modules"
  virtual_network_1_id                  = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet1"
  virtual_network_1_name                = "spacelift-test-vnet1"
  virtual_network_2_resource_group_name = "spacelift-test-modules"
  virtual_network_2_id                  = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelit-test-vnet2"
  virtual_network_2_name                = "spacelit-test-vnet2"

}
