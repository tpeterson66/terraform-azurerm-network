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
variable "location" {
  type        = string
  description = "The Azure Region where the Portal Dashboard will be deployed"
}
variable "resource_group_name" {
  type        = string
  description = "The Azure Resource Group Name for management"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "dashboards" {
  description = "Dashboards definitions"
  type = list(
    object({
      name      = string
      tpl_file  = string
      variables = map(string)
    })
  )
}

# resources
# portal_dashboard
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/portal_dashboard
resource "azurerm_portal_dashboard" "this" {
  for_each = { for d in var.dashboards : d.name => d }
  name                = each.key
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  dashboard_properties = templatefile(each.value.tpl_file, each.value.variables)
}

# outputs
output "ids" {
  value       = { for k, v in azurerm_portal_dashboard.this: k => v.id }
  description = "The IDs of Azure Portal Dashboards."
}