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
  description = "The name of the virtual network peering from vnet 1 to vnet 2."
}
variable "name_back" {
  type        = string
  description = "The name of the virtual network peering from vnet 2 to vnet 1."
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "virtual_network_1_name" {
  description = "The name of virtual network 1 for which we are configuring peering."
  type        = string
}
variable "virtual_network_1_id" {
  description = "The ID of virtual network 1 for which we are configuring peering."
  type        = string
}
variable "virtual_network_1_resource_group_name" {
  description = "The name of the resource group for which we are configuring peering."
  type        = string
}
variable "virtual_network_2_name" {
  description = "The name of virtual network 2 for which we are configuring peering."
  type        = string
}
variable "virtual_network_2_id" {
  description = "The ID of virtual network 2 for which we are configuring peering."
  type        = string
}
variable "virtual_network_2_resource_group_name" {
  description = "The name of the resource group for which we are configuring peering."
  type        = string
}

# resources 
# virtual network peering
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering
resource "azurerm_virtual_network_peering" "this" {
  name                      = var.name
  resource_group_name       = var.virtual_network_1_resource_group_name
  virtual_network_name      = var.virtual_network_1_name
  remote_virtual_network_id = var.virtual_network_2_id
}
resource "azurerm_virtual_network_peering" "this_back" {
  name                      = var.name_back
  resource_group_name       = var.virtual_network_2_resource_group_name
  virtual_network_name      = var.virtual_network_2_name
  remote_virtual_network_id = var.virtual_network_1_id
}

# outputs