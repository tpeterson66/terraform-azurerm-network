provider "azurerm" {
  features {}
}

# // load balancer
module "load_balancer" {
  source                         = "../"
  name                           = "spacelift-load-balancer"
  location                       = "EastUS"
  resource_group_name            = "spacelift-test-modules"
  public_ip_name                 = "spacelift-publicip" 
  frontend_ip_configuration_name = "spacelift-frontendipconfig"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // load balancer dynamic
module "load_balancer_dynamic" {
  source                         = "../"
  name                           = "spacelift-load-balancer-dynamic"
  location                       = "EastUS"
  resource_group_name            = "spacelift-test-modules"
  public_ip_name                 = "spacelift-publicipdynamic" 
  frontend_ip_configuration_name = "spacelift-frontendipconfigdynamic"
  allocation_method              = "Dynamic" 

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}