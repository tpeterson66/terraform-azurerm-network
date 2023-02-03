provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-serviceplan"
  location = "EastUS"
}
// service_plan
module "service_plan" {
  source              = "../"
  name                = "spacelift-serviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "B1"
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

// service_plan_with_app_service_environment
module "service_plan_with_environment" {
  source                     = "../"
  name                       = "spacelift-serviceplan1"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  os_type                    = "Windows"
  sku_name                   = "I1v2"
  app_service_environment_id = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-serviceplan/providers/Microsoft.Web/hostingEnvironments/spacelift-testing"
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}