terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
# variables
variable "name" {
  description = "A name for a Static Site"
  type        = string
}
variable "location" {
  description = "Azure location where Static Site will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Static Site."
  type        = string
}
variable "sku_tier" {
  description = "Specifies the SKU tier of the Static Web App. Possible values are Free or Standard. Defaults to Free."
  type        = string

  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "Allowed values are Free or Standard."
  }
}
variable "sku_size" {
  description = "Specifies the SKU size of the Static Web App. Possible values are Free or Standard. Defaults to Free."
  type        = string

  validation {
    condition     = contains(["Free", "Standard"], var.sku_size)
    error_message = "Allowed values are Free or Standard."
  }
}
# variable "identity_type" {
#   description = "The Type of Managed Identity assigned to this Static Site resource. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned."
#   type        = string
#   default = "null"
# }
# variable "user_assigned_identities" {
#   type        = list(string)
#   description = "Specifies User Assigned Managed Identity IDs to be assigned to this static site."
#   default = null
# }

# resources
# static site
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/static_site
resource "azurerm_static_site" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size

  # dynamic "identity" {
  #   for_each = var.user_assigned_identities

  #   content {
  #     type         = var.identity_type
  #     identity_ids = var.user_assigned_identities

  #   }
  # }
}

# outputs
output "id" {
  value       = azurerm_static_site.this.id
  description = "The ID of the Static Site."
}
output "default_host_name" {
  value       = azurerm_static_site.this.default_host_name
  description = "The Default Hostname associated with the Static Site."
}

output "api_key" {
  value       = azurerm_static_site.this.api_key
  description = "The API Key for the static site, used to push code to the static web app"
}