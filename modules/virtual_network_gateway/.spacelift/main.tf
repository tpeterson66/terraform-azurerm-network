provider "azurerm" {
  features {}
}

# // virtual network gateway
module "virtual_network_gateway" {
  source                = "../"
  name                  = "spacelift-vnetgateway"
  location              = "East US"
  resource_group_name   = "spacelift-test-modules"
  sku                   = "VpnGw1AZ"
  type                  = "Vpn"
  ip_configuration_name = "spacelift-ipconfig"
  subnet_id             = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet1/subnets/GatewaySubnet"
  public_ip_address_id  = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/publicIPAddresses/spacelift-publicip"
}

# // virtual network gateway specific
module "virtual_network_gateway_specific" {
  source                               = "../"
  name                                 = "spacelift-vnetgateway2"
  location                             = "East US"
  resource_group_name                  = "spacelift-test-modules"
  sku                                  = "VpnGw3"
  type                                 = "Vpn"
  vpn_type                             = "PolicyBased"
  active_active                        = false
  enable_bgp                           = false
  ip_configuration_name                = "spacelift-ipconfig"
  subnet_id                            = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelit-test-vnet2/subnets/GatewaySubnet"
  public_ip_address_id                 = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/publicIPAddresses/spacelift-publicip1"
  private_ip_address_allocation_method = "Dynamic"

}
