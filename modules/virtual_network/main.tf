terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
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

  default = {
    source = "terraform"
  }
}

# resources
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network
resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags

  dns_servers = flatten(
    concat(
      try(lookup(var.settings.vnet, "dns_servers", [])),
      try(local.dns_servers_process, [])
    )
  )

  dynamic "ddos_protection_plan" {
    for_each = var.ddos_id != "" || can(var.global_settings["ddos_protection_plan_id"]) ? [1] : []

    content {
      id     = var.ddos_id != "" ? var.ddos_id : var.global_settings["ddos_protection_plan_id"]
      enable = true
    }
  }

  lifecycle {
    ignore_changes = [name]
  }
}

# outputs