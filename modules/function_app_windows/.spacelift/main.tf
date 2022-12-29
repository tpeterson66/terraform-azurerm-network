provider "azurerm" {
  features {}
}

# // function app windows
module "function_app_windows" {
  source                       = "../"
  name                         = "spacelift-function-app-windows"
  location                     = "EastUS"
  resource_group_name          = "spacelift-test-modules"
  service_plan_id              = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Web/serverfarms/spacelift-test-serviceplanwindows"
  storage_account_name         = "ahmedbstorageaccount"
  storage_account_access_key   = "Np7Qr+WFcrKm9eCrL+6DwGb3aYxZzAS87V5UjK9e/ej9MkrFWz1RedXh0F2E7CLBRC9nYRXrzinu+AStSNUEfg=="
  elastic_instance_minimum     = "2"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
