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
  description = "A name for Linux Function App."
  type        = string
}
variable "location" {
  description = "Azure location where Linux Function App will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Linux Function App."
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
variable "enable_diagnostics"{
  type = bool
  description = "Do you want to enable monitor diagnostic setting for this resource?"
}
variable "log_analytics_workspace_id" {
  description = "The name of the resource group in which to create the Storage account."
  type        = string
}
variable "enable_metric_alerts"{
  description = "Do you want to enable monitor metric alert for this resource?"
  type        = bool
}
variable "metric_alerts"{
  description = "Monitor Metric alert variables to be passed"
  type        = list(object({
      name               = string
      metric_namespace   = string
      metric_name        = string
      aggregation        = string
      operator           = string
      threshold          = string
      dimension_name     = string
      dimension_operator = string
      dimension_values   = list(string)
    }))
}
variable "action_group_id"{
  description = "The ID of action group to be used in monitoring alerts."
  type = string
}

# resources
# linux function app
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_function_app
resource "azurerm_linux_function_app" "this" {
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

# modules
# monitor diagnostic settings
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting
module "monitor_diagnostic_setting" {
  source = "../monitor_diagnostic_settings"

  name                       = "${var.name}_diagnostic_setting"
  target_resource_id         = azurerm_linux_function_app.this.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enable_diagnostics         = var.enable_diagnostics
}
# metric alert
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert
module "monitor_metric_alerts" {
  source = "../monitor_metric_alert"
  resource_group_name  = var.resource_group_name
  scopes               = [azurerm_linux_function_app.this.id]
  metric_alerts        = var.metric_alerts
  action_group_id      = var.action_group_id
  enable_metric_alerts = var.enable_metric_alerts
}

# outputs
output "id" {
  value       = azurerm_linux_function_app.this.id
  description = "ID of Linux Function App"
}
output "name" {
  value       = azurerm_linux_function_app.this.name
  description = "ID of Linux Function App"
}