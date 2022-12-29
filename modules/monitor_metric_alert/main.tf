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
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Monitor Metric Alert."
  type        = string
}
variable "action_group_id" {
  description = "Specifies the ID of the Action group"
  type        = string
}
variable "metric_alerts" {
  description = "Monitor Metric alert variables to be passed"
  type = list(object({
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
variable "enable_metric_alerts" {
  description = "Do you want to enable monitor metric alert for this resource?"
  type        = bool
}
variable "scopes" {
  description = "A set of strings of resource IDs at which the metric criteria should be applied."
  type        = list(string)
}

# resources
# metric alert
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert
resource "azurerm_monitor_metric_alert" "this" {
  for_each            = { for this in var.metric_alerts : this.name => this if var.enable_metric_alerts }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes

  criteria {
    metric_namespace = each.value.metric_namespace
    metric_name      = each.value.metric_name
    aggregation      = each.value.aggregation
    operator         = each.value.operator
    threshold        = each.value.threshold

    dimension {
      name     = each.value.dimension_name
      operator = each.value.dimension_operator
      values   = each.value.dimension_values
    }
  }

  action {
    action_group_id = var.action_group_id
  }
}

# outputs
output "id" {
  value = {
    for k, v in azurerm_monitor_metric_alert.this : k => v.id
  }
  description = "The ID of the metric alert."
}