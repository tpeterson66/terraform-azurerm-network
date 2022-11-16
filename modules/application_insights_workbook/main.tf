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
  description = "Specifies the Name of the Application Insights Workbook. Specifies the name of this Workbook as a UUID/GUID. It should not contain any uppercase letters. "
}
variable "location" {
  type        = string
  description = "The Azure Region where the Application Insights Workbook will be deployed"
}
variable "resource_group_name" {
  type        = string
  description = "The Azure Resource Group Name for management"
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "display_name" {
  type        = string
  description = "Specifies the user-defined name (display name) of the workbook."
}
variable "data_json"{
  type        = string
  description = "Path to workbook data json file"
}

# resources
# application_insights_workbook
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights_workbook
resource "azurerm_application_insights_workbook" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  display_name        = var.display_name
  tags                = var.tags
  data_json           = jsonencode(file(var.data_json))
}

# outputs 
output "id" {
  value       = azurerm_application_insights_workbook.this.id
  description = "The ID of the Application Insights Workbook."
}