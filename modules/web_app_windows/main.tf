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
  description = "A name for Windows App Service "
  type        = string
}
variable "location" {
  description = "Azure location where Windows App Service will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Windows App Service."
  type        = string
}
variable "service_plan_id" {
  type        = string
  description = "The id of App Service Plan to be used."
}
variable "header_frontdoor_id" {
  type        = string
  description = "Front door header"
}
variable "firewall_ip" {
  type        = string
  description = "Firewall IP"
}
variable "app_settings" {
  type        = map(string)
  description = "A map of key-value pairs of App Settings."
  default = {}
}
variable "app_command_line" {
  type        = string
  description = "The App command line to launch."
}
variable "connection_strings" {
  description = "Optional Connection Strings"
  default     = []
  type        = list(object({
    name  = string
    type  = string
    value = string
  }))
}

# resources
# Windows web app
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_web_app
resource "azurerm_windows_web_app" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id
  tags                = var.tags
  app_settings        = var.app_settings

  site_config {
    health_check_path = "/app/"
    app_command_line  = var.app_command_line
    ip_restriction {
      name           = "allowFrontDoorThroughFirewall"
      ip_address     = "${var.firewall_ip}/32"
      action         = "Allow"
      priority       = "4"
       headers {
         x_azure_fdid = [var.header_frontdoor_id]
       }
     }
    ip_restriction {
      name           = "denyAll"
      ip_address     = "0.0.0.0/0"
      action         = "Deny"
      priority       = "5"
    }
  }
  dynamic "connection_string" {
    for_each = var.connection_strings
    content {
      name  = connection_string.value["name"]
      type  = connection_string.value["type"]
      value = connection_string.value["value"]
    }
  }
  lifecycle {
    ignore_changes = [site_config]
  }
}

# outputs
output "id" {
  value       = azurerm_windows_web_app.this.id
  description = "Windows Web App ID"
}
output "name" {
  value       = azurerm_windows_web_app.this.name
  description = "Windows Web App Name"
}
output "default_hostname" {
  value       = azurerm_windows_web_app.this.default_hostname
  description = "Default Site Hostname for Windows Web App"
}