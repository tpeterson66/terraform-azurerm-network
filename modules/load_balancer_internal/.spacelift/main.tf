provider "azurerm" {
  features {}
}

# // load balancer internal
module "load_balancer_internal" {
  source                         = "../"
  name                           = "spacelift-load-balancer-internal"
  location                       = "EastUS 2"
  resource_group_name            = "spacelift-test-modules"
  frontend_ip_configuration_name = "spacelift-frontendipconfiginternallb"
  subnet_id                      = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/spacelift-lb"
  backend_pool_name              = "spacelift-backend-pool"
  allocation_method              = "Dynamic"
  sku                            = "Standard"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
