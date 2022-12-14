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
  description = "A name of the Microsoft SQL Server. This needs to be globally unique within Azure."
  type        = string
}
variable "location" {
  description = "Azure location where SQL Server will be deployed"
  type        = string
}
variable "tags" {
  description = "A map of the tags to use on the resources that are deployed with this module."
  type        = map(string)
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the SQL Server."
  type        = string
}
variable "administrator_login" {
  description = "The administrator login name for the new server. Changing this forces a new resource to be created."
  type        = string
}
variable "administrator_login_password" {
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
  type        = string
}
variable "mssql_server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and [12.0] (for v12 server)."
  type        = string
}

# resources
# mssql server
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_server
resource "azurerm_mssql_server" "this" {
  name                         = var.name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.mssql_server_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  tags                         = var.tags

}

# outputs
output "id" {
  value       = azurerm_mssql_server.this.id
  description = "SQL Server ID"
}
output "name" {
  value       = azurerm_mssql_server.this.name
  description = "SQL Server Name"
}