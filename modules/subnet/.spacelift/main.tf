provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-subnet"
  location = "EastUS"
}

# // subnet
module "subnet" {
  source                                        = "../"
  name                                          = "spaceliftsubnet"
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = "spacelift-test-vnetsubnet"
  address_prefixes                              = ["10.7.1.0/24"]
  service_endpoints                             = ["Microsoft.Storage"]
  private_endpoint_network_policies_enabled     = false
  private_link_service_network_policies_enabled = false
  settings                                      = []
}

# // subnet
module "subnet_specific" {
  source                                        = "../"
  name                                          = "spaceliftsubnet1"
  resource_group_name                           = azurerm_resource_group.rg.name
  virtual_network_name                          = "spacelift-test-vnetsubnet"
  address_prefixes                              = ["10.7.2.0/24"]
  service_endpoints                             = ["Microsoft.Storage"]
  private_endpoint_network_policies_enabled     = false
  private_link_service_network_policies_enabled = false
  settings = [{
    delegation = {
      delegation1 = {
        "name"               = "test"
        "service_delegation" = "Microsoft.ContainerInstance/containerGroups"
        "actions"            = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
      }
    }
  }]
}
