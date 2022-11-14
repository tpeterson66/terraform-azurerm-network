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
  description = "A name for a Monitor Diagnostic Setting"
  type        = string
}
variable "log_analytics_workspace_id" {
  description = "The name of the resource group in which to create the Storage account."
  type        = string
}
variable "target_resource_id" {
  description = "The name of the resource group in which to create the Storage account."
  type        = string
}
variable "enable_diagnostics"{
  type = bool
  description = "Do you want to enable monitor diagnostic setting for this resource?"
}

# data
# monitor diagnostic categories
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/monitor_diagnostic_categories
data "azurerm_monitor_diagnostic_categories" "this" {
  resource_id = var.target_resource_id
}

# resources
# monitor diagnostic setting
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting
resource "azurerm_monitor_diagnostic_setting" "this" {
  name                       = var.name
  count                      = var.enable_diagnostics? 1 : 0
  target_resource_id         = var.target_resource_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.this.log_category_types
    content {
        category = log.value
        enabled  = true

        retention_policy {
        enabled = false
        }
    }
  }
  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.this.metrics
    content {
        category = metric.value

        retention_policy {
        enabled = false
        }
    }
  }
}

# outputs
output "id" {
  value       = var.enable_diagnostics ? azurerm_monitor_diagnostic_setting.this[0].id : null
  description = "The ID of Monitor Diagnostic Setting"
}
