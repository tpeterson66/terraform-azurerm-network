provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-mssqlserver"
  location = "EastUS"
}

# // mssql server
module "mssql_server" {
  source                       = "../"
  name                         = "spacelift-mssql-server"
  location                     = azurerm_resource_group.rg.location
  resource_group_name          = azurerm_resource_group.rg.name
  administrator_login          = "AddYourLogin"
  administrator_login_password = "AddYourPw"
  mssql_server_version         = "12.0"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

