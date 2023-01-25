provider "azurerm" {
  features {}
}

# // load balancer gateway
module "load_balancer_gateway" {
  source                         = "../"
  name                           = "spacelift-load-balancer-gateway"
  location                       = "EastUS 2"
  resource_group_name            = "spacelift-test-modules"
  frontend_ip_configuration_name = "spacelift-frontendipconfigloadbalancer"
  subnet_id                      = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/spacelift-lb"
}
