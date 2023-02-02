provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-storageaccount"
  location = "EastUS"
}

# // storage account
module "storage_account" {
  source                        = "../"
  name                          = "spaceliftaccount32131"
  location                      = azurerm_resource_group.rg.location
  resource_group_name           = azurerm_resource_group.rg.name
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  is_hns_enabled                = false
  public_network_access_enabled = true
  default_action                = "Deny"
  bypass                        = ["None"]
  ip_rules                      = ["20.127.251.158"]
  virtual_network_subnet_ids    = ["/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet1/subnets/default"]

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}
