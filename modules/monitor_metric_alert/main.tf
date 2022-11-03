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
  description = "A name for a Monitor Metric Alert."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Monitor Metric Alert."
  type        = string
}
variable "scopes" {
  description = "A set of strings of resource IDs at which the metric criteria should be applied."
  type        = list(string)
}
variable "short_name" {
  description = "Specifies the name of the Action group"
  type        = string
}
variable "metric_namespace" {
  description = "One of the metric namespaces to be monitored."
  type        = string
}
variable "metric_name" {
  description = "One of the metric names to be monitored."
  type        = string
}
variable "aggregation" {
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total."
  type        = string
}
variable "operator" {
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual."
  type        = string
}
variable "threshold" {
  description = "The criteria threshold value that activates the alert."
  type        = string
}
variable "dimension_name" {
  description = "One of the dimension names."
  type        = string
}
variable "dimension_operator" {
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith."
  type        = string
}
variable "dimension_values" {
  description = "The list of dimension values."
  type        = list(string)
}

# resources
# metric alert
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_metric_alert
resource "azurerm_monitor_metric_alert" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold

    dimension {
      name     = var.dimension_name
      operator = var.dimension_operator
      values   = var.dimension_values
    }
  }

  action {
    action_group_id = module.monitor_action_group.id
  }
}
# modules
# monitor action group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group
module "monitor_action_group" {
  source = "../monitor_action_group"

  name                = "${var.name}_action_group"
  resource_group_name = var.resource_group_name
  short_name          = var.short_name
}

# outputs
output "id" {
  value       = azurerm_monitor_metric_alert.this.id
  description = "The ID of the metric alert."
}