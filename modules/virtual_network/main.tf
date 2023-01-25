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
  description = "The name of the virtual network"
}
variable "location" {
  type        = string
  description = "The Azure Region where the virutal network will be deployed"
}
variable "resource_group_name" {
  type        = string
  description = "The Azure Resource Group Name for management"
}
variable "address_space" {
  type        = list(string)
  description = "The address space for the virtaul network"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "ddos_id" {
  type        = string
  description = "The ID of the DDoS Protection Plan"
}
variable "settings" {
  type = list(object({
    dns_servers = list(string)
  }))
  default = [{
    dns_servers = []
  }]
}

# resources
# virtual network
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_id != "" ? [1] : []

    content {
      id     = var.ddos_id
      enable = true
    }
  }

  lifecycle {
    ignore_changes = [name]
  }
}
# dns servers
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_dns_servers
resource "azurerm_virtual_network_dns_servers" "this" {
  virtual_network_id = azurerm_virtual_network.this.id
  dns_servers        = var.settings[0].dns_servers != "" ? lookup(var.settings[0], "dns_servers") : []
}

# outputs
output "id" {
  description = "Generated virtual network id"
  value       = azurerm_virtual_network.this.id
}
output "name" {
  description = "Generated virtual network name"
  value       = azurerm_virtual_network.this.name
}