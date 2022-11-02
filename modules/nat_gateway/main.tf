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
  description = "Specifies the name of the NAT Gateway. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "Specifies the supported Azure location where the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the NAT Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "sku_name" {
  description = "The SKU which should be used. At this time the only supported value is Standard. Defaults to Standard."
  type        = string
  default     = "Standard"
}
variable "idle_timeout_in_minutes" {
  description = " The idle timeout which should be used in minutes. Defaults to 4"
  type        = number
  default     = 4

    validation {
    condition     = (try(var.idle_timeout_in_minutes, false) == true ? (var.idle_timeout_in_minutes.value >= 4 || var.idle_timeout_in_minutes.value <= 30) : true)
    error_message = "Provide an allowed value as defined in https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway#idle_timeout_in_minutes."
  }
}
variable "zones" {
  description = "Specifies a list of Availability Zones in which this NAT Gateway should be located. Changing this forces a new NAT Gateway to be created."
  type        = list
  default     = null
}

# resources
# NAT gateway
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/nat_gateway
resource "azurerm_nat_gateway" "this" {
  name                    = var.name
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku_name                = var.sku_name
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  zones                   = var.zones
  tags                    = var.tags
}

# outputs
output "resource_guid" {
  value       = azurerm_nat_gateway.this.resource_guid
  description = "The resource GUID property of the NAT Gateway."
}
output "id" {
  value       = azurerm_nat_gateway.this.id
  description = "The ID of the NAT Gateway."
}