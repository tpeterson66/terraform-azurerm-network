terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# variables
variable "name" {
  type        = string
  description = "The name of the Azure ExpressRoute Circuit"
}
variable "location" {
  type        = string
  description = "The Azure Region where the Azure ExpressRoute Circuit will be deployed"
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
variable "port_name" {
  type        = string
  description = "The name of the Azure ExpressRoute Port"
}
variable "bandwidth_in_gbps" {
  type        = string
  description = "Bandwidth of the Express Route Port in Gbps."
}
variable "encapsulation" {
  type        = string
  description = "The encapsulation method used for the Express Route Port. Possible values are: Dot1Q, QinQ."
}
variable "peering_type" {
  type        = string
  description = "The type of the ExpressRoute Circuit Peering. Acceptable values include [AzurePrivatePeering], AzurePublicPeering and MicrosoftPeering"
  default     = "AzurePrivatePeering"
}
variable "vlan_id" {
  type        = number
  description = "A valid VLAN ID to establish this peering on."
}
variable "peer_asn" {
  type        = number
  description = "The Either a 16-bit or a 32-bit ASN. Can either be public or private."
}
variable "ipv4_enabled" {
  type        = bool
  description = "A boolean value indicating whether the IPv4 peering is enabled. Defaults to true."
  default     = true
}
variable "primary_peer_address_prefix" {
  type        = string
  description = "A /30 subnet for the primary link. Required when config for IPv4."
}
variable "secondary_peer_address_prefix" {
  type        = string
  description = " A /30 subnet for the secondary link. Required when config for IPv4."
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
# express_route_port
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_port
resource "azurerm_express_route_port" "this" {
  name                = var.port_name
  resource_group_name = var.resource_group_name
  location            = var.location
  peering_location    = var.peering_location
  bandwidth_in_gbps   = var.bandwidth_in_gbps
  encapsulation       = var.encapsulation
}
# express_route_circuit_peering
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/express_route_circuit_peering
resource "azurerm_express_route_circuit_peering" "this" {
  peering_type                  = var.peering_type
  express_route_circuit_name    = azurerm_express_route_circuit.this.name
  resource_group_name           = var.resource_group_name
  peer_asn                      = var.peer_asn
  primary_peer_address_prefix   = var.primary_peer_address_prefix
  secondary_peer_address_prefix = var.secondary_peer_address_prefix
  vlan_id                       = var.vlan_id
}

# outputs
output "id" {
  value       = azurerm_express_route_circuit.this.id
  description = "ID of Azure ExpressRoute Circuit."
}
output "name" {
  value       = azurerm_express_route_circuit.this.name
  description = "Name of Azure ExpressRoute Circuit."
}
output "port_id" {
  value       = azurerm_express_route_port.this.id
  description = "ID of Azure ExpressRoute Port."
}
output "port_name" {
  value       = azurerm_express_route_port.this.name
  description = "Name of Azure ExpressRoute Port."
}
output "peering_id" {
  value       = azurerm_express_route_circuit_peering.this.id
  description = "ID of Azure ExpressRoute Circuit Peering."
}
output "service_provider_provisioning_state" {
  value       = azurerm_express_route_circuit.this.service_provider_provisioning_state
  description = "Azure ExpressRoute Circuit service_provider_provisioning_state post creation"
}