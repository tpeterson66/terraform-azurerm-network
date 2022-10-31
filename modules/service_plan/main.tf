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
  description = "A name for App Service Plan"
  type        = string
}
variable "location" {
  description = "Azure location where App Service Plan will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the app service plan."
  type        = string
}
variable "os_type" {
  description = "The O/S type for the App Services to be hosted in this plan. Possible values include Windows, Linux, and WindowsContainer"
  type        = string
}
variable "sku_name" {
  type        = string
  description = "The SKU for the plan. Possible values include B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, and Y1."
}
variable "app_service_environment_id" {
  type        = string
  default     = ""
  description = "The ID of the App Service Environment to create this Service Plan in. Requires an Isolated SKU. Use one of I1, I2, I3 for azurerm_app_service_environment, or I1v2, I2v2, I3v2 for azurerm_app_service_environment_v3"
}

# resources 
# service plan
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan
resource "azurerm_service_plan" "this" {
  name                       = var.name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  os_type                    = var.os_type
  sku_name                   = var.sku_name
  app_service_environment_id = var.app_service_environment_id == "" ? null : var.app_service_environment_id
  tags                       = var.tags
}

# outputs
output "id" {
    value       = azurerm_service_plan.this.id
    description = "Azure App Service Plan ID"
}
output "name" {
    value       = azurerm_service_plan.this.name
    description = "Azure App Service Plan name"
}