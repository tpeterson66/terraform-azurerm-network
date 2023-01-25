provider "azurerm" {
  features {}
}

# // mssql server
module "mssql_server" {
  source                       = "../"
  name                         = "spacelift-mssql-server"
  location                     = "EastUS"
  resource_group_name          = "spacelift-test-modules"
  administrator_login          = "AddYourLogin"
  administrator_login_password = "AddYourPw"
  mssql_server_version        = "12.0" 

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

