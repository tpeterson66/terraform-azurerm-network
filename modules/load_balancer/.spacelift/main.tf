provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-lb"
  location = "EastUS"
}

# // load balancer
module "load_balancer" {
  source                         = "../"
  name                           = "spacelift-load-balancer"
  location                       = azurerm_resource_group.rg.location
  resource_group_name            = azurerm_resource_group.rg.name
  public_ip_name                 = "spacelift-publicip"
  frontend_ip_configuration_name = "spacelift-frontendipconfig"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
###
# // load balancer dynamic
module "load_balancer_dynamic" {
  source                         = "../"
  name                           = "spacelift-load-balancer-dynamic"
  location                       = azurerm_resource_group.rg.location
  resource_group_name            = azurerm_resource_group.rg.name
  public_ip_name                 = "spacelift-publicipdynamic"
  frontend_ip_configuration_name = "spacelift-frontendipconfigdynamic"
  allocation_method              = "Dynamic"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}