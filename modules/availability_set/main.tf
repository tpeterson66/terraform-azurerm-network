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
  description = "Specifies the Name of the Availability set. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which the Availability set should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "platform_update_domain_count" {
  description = "Specifies the number of update domains that are used. Defaults to 5."
  type        = number
}
variable "platform_fault_domain_count" {
  description = "Specifies the number of fault domains that are used. Defaults to 3.The number of Fault Domains varies depending on which Azure Region you're using - a list can be found here:https://github.com/MicrosoftDocs/azure-docs/blob/main/includes/managed-disks-common-fault-domain-region-list.md"
  type        = number
}

# resources
# availability set
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/availability_set
resource "azurerm_availability_set" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
  platform_update_domain_count = var.platform_update_domain_count
  platform_fault_domain_count  = var.platform_fault_domain_count
}

# outputs
output "id" {
  value       = azurerm_availability_set.this.id
  description = "Azure Availability set ID"
}
output "name" {
  value       = azurerm_availability_set.this.name
  description = "Azure Availability set Name"
}
