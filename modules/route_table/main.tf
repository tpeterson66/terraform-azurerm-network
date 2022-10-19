terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
provider "azurerm"  {
  features {}
}

# variables
variable "name" {
  description = "A name for route table"
  type        = string
}
variable "location" {
  description = "Azure location where route table will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the route table."
  type        = string
}
variable "disable_bgp_route_propagation" {
  type        = bool
  description = "Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable."
  default     = false
}
variable "routes" {
  type        = list(object({
    name           = string # The name for the route
    address_prefix = string # The destination to which the route applies. Can be CIDR (such as 10.1.0.0/16) or Azure Service Tag (such as ApiManagement, AzureBackup or AzureMonitor) format.
    next_hop_type  = string # The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None.
    next_hop_in_ip_address = string # Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance.
  }))
  description = "Routes to be added to the route table"
  default     = []
}

# resources
# route table
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route_table
resource "azurerm_route_table" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = var.disable_bgp_route_propagation
  tags                          = var.tags
}
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/route
  route {
    for_each               = { for route in var.routes : route.name => route }
    name                   = each.key
    resource_group_name    = var.resource_group_name
    route_table_name       = azurerm_route_table.this.name
    address_prefix         = each.value.address_prefix
    next_hop_type          = each.value.next_hop_type
    next_hop_in_ip_address = try(lower(each.value.next_hop_type), null) == "VirtualAppliance" ? each.value.next_hop_in_ip_address : null
  }

# outputs
output "name" {
  value       = azurerm_route_table.this.name
  description = "Azure route table name post creation"
}
output "id" {
  value       = azurerm_route_table.this.id
  description = "Azure route table ID post creation"
}
