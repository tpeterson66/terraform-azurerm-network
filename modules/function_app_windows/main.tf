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
  description = "A name for Windows Function App."
  type        = string
}
variable "location" {
  description = "Azure location where Windows Function App will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Windows Function App."
  type        = string
}
variable "service_plan_id" {
  type        = string
  description = "The id of App Service Plan to be used."
}
variable "storage_account_name" {
  type        = string
  description = "The backend storage account name which will be used by this Function App (such as the dashboard, logs)."
}
variable "storage_account_access_key" {
  type        = string
  description = "The access key which will be used to access the backend storage account for the Function App."
}
variable "elastic_instance_minimum" {
  type        = number
  description = "The number of minimum instances for this function app. Only affects apps on the Premium plan."
}

# resources
# windows function app
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_function_app
resource "azurerm_windows_function_app" "this" {
  name                       = var.name
  resource_group_name        = var.resource_group_name
  location                   = var.location
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_account_access_key
  service_plan_id            = var.service_plan_id

  site_config {
    elastic_instance_minimum = var.elastic_instance_minimum
  }
  lifecycle {
    ignore_changes = [site_config, app_settings, tags]
  }
}

# outputs
output "id" {
  value       = azurerm_windows_function_app.this.id
  description = "ID of Windows Function App"
}
output "name" {
  value       = azurerm_windows_function_app.this.name
  description = "ID of Windows Function App"
}