provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-containergroup"
  location = "EastUS"
}

# // container group
module "container_group" {
  source              = "../"
  name                = "spacelift-containergroup"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  restart_policy      = "Never"
  container_name      = "containertest"
  container_image     = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
  container_cpu       = "0.5"
  container_memory    = "1.5"
  container_port      = "443"
  container_protocol  = "TCP"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
