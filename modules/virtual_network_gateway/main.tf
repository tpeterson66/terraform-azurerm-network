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
  description = "Specifies the name of the Virtual Network Gateway. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "Specifies the supported Azure location where the Virtual Network Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Virtual Network Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "sku" {
  description = "Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn_type and generation arguments."
  type        = string
}
variable "type" {
  description = "The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute."
  type        = string
}
variable "vpn_type" {
  description = "The routing type of the Virtual Network Gateway. Valid options are [RouteBased] or PolicyBased."
  type        = string
  default     = "RouteBased"
}
variable "active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false."
  type        = bool
  default     = false
}
variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  type        = bool
  default     = false
}
variable "ip_configuration_name" {
  description = "Specifies the name of the IP configuration."
  type        = string
}
variable "subnet_id" {
  description = "Specifies the ID of subnet to be used. Expecting to reference a gateway subnet with name GatewaySubnet"
  type        = string
}
variable "public_ip_address_id" {
  description = "Specifies the ID of public IP to be used."
  type        = string
}
variable "private_ip_address_allocation_method" {
  description = "Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or [Dynamic]."
  type        = string
  default     = "Dynamic"
}

# resources
# virtual network gateway
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_gateway
resource "azurerm_virtual_network_gateway" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  type     = var.type
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku

  ip_configuration {
    name                          = var.ip_configuration_name
    public_ip_address_id          = var.public_ip_address_id
    private_ip_address_allocation = var.private_ip_address_allocation_method
    subnet_id                     = var.subnet_id
  }
}

# outputs
output "id" {
  value       = azurerm_virtual_network_gateway.this.id
  description = "Virtual Network Gateway ID"
}
