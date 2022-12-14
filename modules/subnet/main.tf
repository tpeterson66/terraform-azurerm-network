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
  description = "The name of the subnet"
}
variable "resource_group_name" {
  type        = string
  description = "The resource group for the resource"
}
variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "address_prefixes" {
  type        = list(string)
  description = "The subnet address prefix"
}
variable "service_endpoints" {
  type        = list(string)
  description = "List of service endpoints.Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web."
}
variable "private_endpoint_network_policies_enabled" {
  type        = bool
  description = "Enforce private endpoint network policies. Defaults to true"
}
variable "private_link_service_network_policies_enabled" {
  type        = bool
  description = "Enforce network policies. Defaults to true."
}
variable "settings" {
  default = {
    delegation = {
      name               = "delegation"
      service_delegation = "Microsoft.ContainerInstance/containerGroups"
      actions            = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
    }
  }
}

# resources
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "this" {

  name                                          = var.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.address_prefixes
  service_endpoints                             = var.service_endpoints
  private_link_service_network_policies_enabled = try(var.private_link_service_network_policies_enabled, false)
  private_endpoint_network_policies_enabled     = try(var.private_endpoint_network_policies_enabled, false)

  dynamic "delegation" {
    for_each = try(var.settings.delegation, null) == null ? [] : [1]

    content {
      name = var.settings.delegation.name

      service_delegation {
        name    = var.settings.delegation.service_delegation
        actions = lookup(var.settings.delegation, "actions", null)
      }
    }
  }

  lifecycle {
    ignore_changes = [name]
  }

}

# outputs