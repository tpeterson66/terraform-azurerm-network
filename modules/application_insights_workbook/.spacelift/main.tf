provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-appinsights"
  location = "EastUS"
}

# // application insights workbook
module "application_insights_workbook" {
  source              = "../"
  name                = "85b3e8bb-fc93-40be-83f2-98f6bec18ba0"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  display_name        = "spacelift-test"
  data_json           = "./workbook_template.json"
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
