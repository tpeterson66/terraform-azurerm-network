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
  type        = string
  description = "The name of the ExpressRoute circuit"
}
variable "location" {
  type        = string
  description = "The Azure Region where the ExpressRoute circuit will be deployed"
}
variable "resource_group_name" {
  type        = string
  description = "The Azure Resource Group Name for management"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "service_provider_name" {
  type        = string
  description = "The name of the ExpressRoute Service Provider."
}
variable "peering_location" {
  type        = string
  description = "The name of the peering location and not the Azure resource location."
}
variable "bandwidth_in_mbps" {
  type        = string
  description = "The bandwidth in Mbps of the circuit being created on the Service Provider.Once you increase your bandwidth, you will not be able to decrease it to its previous value."
}
variable "sku_tier" {
  type        = string
  description = "The service tier. Possible values are Basic, Local, Standard or Premium."
}
variable "sku_family" {
  type        = string
  description = "The billing mode for bandwidth. Possible values are [MeteredData] or UnlimitedData."
  default     = "MeteredData"
}

# resources
# express_route_circuit
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit
resource "azurerm_express_route_circuit" "this" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  service_provider_name = var.service_provider_name
  peering_location      = var.peering_location
  bandwidth_in_mbps     = var.bandwidth_in_mbps
  tags                  = var.tags

  sku {
    tier   = var.sku_tier
    family = var.sku_family
  }
}

# outputs
output "id" {
  value       = azurerm_express_route_circuit.this.id
  description = "ID of Azure Express Route Circuit."
}
output "name" {
  value       = azurerm_express_route_circuit.this.name
  description = "Name of Azure Express Route Circuit."
}