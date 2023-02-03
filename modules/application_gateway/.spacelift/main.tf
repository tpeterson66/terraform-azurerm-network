provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-applicationgateway"
  location = "EastUS"
}

# // application gateway
module "application_gateway" {
  source                             = "../"
  name                               = "spacelift-applicationgateway"
  location                           = azurerm_resource_group.rg.location
  resource_group_name                = azurerm_resource_group.rg.name
  application_gateway_sku            = "Standard_v2"
  application_gateway_tier           = "Standard_v2"
  application_gateway_capacity       = "1"
  gateway_ip_configuration_subnet_id = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet1/subnets/default"
  private_ip_address                 = "10.3.0.11"
  public_ip_name                     = "spacelift-publiciptest"
  public_ip_sku                      = "Standard"
  allocation_method                  = "Static"
  private_ip_address_allocation      = "Static"
  user_assigned_identity_name        = "spacelift-userassignedidentity"
  rule_type                          = "Basic"
  create_identity                    = true
  user_assigned_identity_id          = [""]

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // application gateway specific
module "application_gateway_specific" {
  source                             = "../"
  name                               = "spacelift-applicationgateway1"
  location                           = azurerm_resource_group.rg.location
  resource_group_name                = azurerm_resource_group.rg.name
  application_gateway_sku            = "Standard_v2"
  application_gateway_tier           = "Standard_v2"
  application_gateway_capacity       = "1"
  gateway_ip_configuration_subnet_id = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-test-vnet1/subnets/default"
  private_ip_address                 = "10.3.0.12"
  public_ip_name                     = "spacelift-publiciptest1"
  public_ip_sku                      = "Standard"
  allocation_method                  = "Static"
  private_ip_address_allocation      = "Static"
  user_assigned_identity_name        = ""
  rule_type                          = "Basic"
  create_identity                    = false
  user_assigned_identity_id          = ["/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-applicationgateway/providers/Microsoft.ManagedIdentity/userAssignedIdentities/spacelift-userassignedidentity"]

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}