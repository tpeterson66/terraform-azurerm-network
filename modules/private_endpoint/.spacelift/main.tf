provider "azurerm" {
  features {}
}

# // Private endpoint
module "private_endpoint" {
  source                          = "../"
  name                            = "spacelift-private-endpoint"
  location                        = "East US 2"
  resource_group_name             = "spacelift-test-modules"
  subnet_id                       = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/virtualNetworks/spacelift-testmock/subnets/test"
  private_connection_resource_id  = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/privateLinkServices/spacelift-privatelinkservice"
  private_service_connection_name = "spacelift-privateserviceconnection"
  is_manual_connection            = false
  private_dns_zone_group_name     = "spacelift-dnsgroupname"
  private_dns_zone_ids            = ["/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Network/privateDnsZones/spacelift-privatednszone.com"]

}

