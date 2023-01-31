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
variable "delegation_name" {
  type        = string
  description = " A name for this delegation."
  default = null
}
variable "service_delegation_name" {
  type        = string
  description = "The name of service to delegate to. Possible values are listed here https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_delegation"
  default = null
}
variable "service_delegation_actions" {
  type = list(string)
  description = "A list of Actions which should be delegated. This list is specific to the service to delegate to. Possible values are listed here https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet#service_delegation"
  default = []
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
    for_each = try(var.delegation_name, null) == null ? [] : [1]

    content {
      name = var.delegation_name

      service_delegation {
        name    = var.service_delegation_name
        actions = var.service_delegation_actions
      }
    }
  }

  lifecycle {
    ignore_changes = [name]
  }

}

# outputs