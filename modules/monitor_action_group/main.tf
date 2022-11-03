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
  description = "Specifies the name of the Action group. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Action group will exist. Changing this forces a new resource to be created."
  type        = string
}
variable "short_name" {
  description = "Specifies the name of the Action group"
  type        = string
}
variable "arm_role_receiver" {
    description = "List of objects with name, role_id and use_common_alert_schema"
    type        = list(object({
      name                    = string
      role_id                 = string
      use_common_alert_schema = bool
    }))
    default = []
}
variable "automation_runbook_receiver" {
    description = "List of objects with name, automation_account_id, runbook_name, webhook_resource_id, is_global_runbook, service_uri, use_common_alert_schema"
    type = list(object({
      name                    = string
      automation_account_id   = string
      runbook_name            = string
      webhook_resource_id     = string
      is_global_runbook       = bool
      service_uri             = string
      use_common_alert_schema = bool
    }))
    default = []
}
variable "azure_app_push_receiver" {
    description = "List of objects with name and email_address."
    type        = list(object({
      name          = string
      email_address = string
    }))
    default = []
}
variable "azure_function_receiver" {
    description = "List of objects with name and email_address."
    type        = list(object({
      name                     = string
      function_app_resource_id = string
      function_name            = string
      http_trigger_url         = string
      use_common_alert_schema  = bool
    }))
    default = []
}
variable "email_settings" {
    description = "List of objects with name, email_address and use_common_alert_schema"
    type        = list(object({
      name                    = string
      email_address           = string
      use_common_alert_schema = bool
    }))
    default = []
}
variable "event_hub_receiver" {
    description = "List of objects with name, event_hub_namespace, event_hub_name, subscription_id and use_common_alert_schema."
    type        = list(object({
      name                    = string
      event_hub_namespace     = string
      event_hub_name          = string
      subscription_id         = string
      use_common_alert_schema = bool
    }))
    default = []
}
variable "itsm_receiver" {
    description = "List of objects with name, workspace_id, connection_id, ticket_configuration and region."
    type        = list(object({
      name                 = string
      workspace_id         = string
      connection_id        = string
      ticket_configuration = string
      region               = string
    }))
    default = []
}
variable "logic_app_receiver" {
    description = "List of objects with name, resource_id, callback_uri and use_common_alert_schema."
    type        = list(object({
      name                    = string
      resource_id             = string
      callback_url            = string
      use_common_alert_schema = bool
    }))
    default = []
}
variable "sms_receiver" {
    description = "List of objects with name, country_code and phone_number."
    type        = list(object({
      name         = string
      country_code = number
      phone_number = number
    }))
    default = []
}
variable "voice_receiver" {
    description = "List of objects with name, country_code and phone_number."
    type        = list(object({
      name         = string
      country_code = number
      phone_number = number
    }))
    default = []
}
variable "webhook_receiver" {
    description = "List of objects with name, service_uri and use_common_alert_schema"
    type        = list(object({
      name                    = string
      service_uri             = string
      use_common_alert_schema = bool
    }))
    default = []
}

# resources
# action group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group
resource "azurerm_monitor_action_group" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  short_name          = var.short_name

  dynamic "arm_role_receiver" {
    for_each = try(var.arm_role_receiver, {})
    content {
      name                    = lookup(arm_role_receiver.value, "name", null)
      role_id                 = lookup(arm_role_receiver.value, "role_id", null)
      use_common_alert_schema = lookup(arm_role_receiver.value, "use_common_alert_schema", null)
    }
  }
  dynamic "automation_runbook_receiver" {
    for_each = try(var.automation_runbook_receiver, {})
    content{
      name                    = lookup(automation_runbook_receiver.value, "name", null)
      automation_account_id   = lookup(automation_runbook_receiver.value, "automation_account_id", null)
      runbook_name            = lookup(automation_runbook_receiver.value, "runbook_name", null)
      webhook_resource_id     = lookup(automation_runbook_receiver.value, "webhook_resource_id", null) 
      is_global_runbook       = lookup(automation_runbook_receiver.value, "is_global_runbook", null)
      service_uri             = lookup(automation_runbook_receiver.value, "service_uri", null)
      use_common_alert_schema = lookup(automation_runbook_receiver.value, "use_common_alert_schema", null)
    }
  }
  dynamic "azure_app_push_receiver" {
    for_each = try(var.azure_app_push_receiver, {})
    content{
      name          = lookup(azure_app_push_receiver.value, "name", null)
      email_address = lookup(azure_app_push_receiver.value, "email_address", null)
    }
  }
  dynamic "azure_function_receiver" {
    for_each = try(var.azure_function_receiver, {})
    content{
      name                     = lookup(azure_function_receiver.value, "name", null)
      function_app_resource_id = lookup(azure_function_receiver.value, "function_app_resource_id", null)
      function_name            = lookup(azure_function_receiver.value, "function_name", null)
      http_trigger_url         = lookup(azure_function_receiver.value, "http_trigger_url", null)
      use_common_alert_schema  = lookup(azure_function_receiver.value, "use_common_alert_schema", null)
    }
  }
  dynamic "email_receiver" {
    for_each = try(var.email_settings, {})
	content {
      name                    = lookup(email_receiver.value, "name", null)
      email_address           = lookup(email_receiver.value, "email_address", null)
      use_common_alert_schema = lookup(email_receiver.value, "use_common_alert_schema", null)
    }
  } 
  dynamic "event_hub_receiver" {
    for_each = try(var.event_hub_receiver, {})
	content {
      name                    = lookup(event_hub_receiver.value, "name", null)
      event_hub_namespace     = lookup(event_hub_receiver.value, "event_hub_namespace", null)
      event_hub_name          = lookup(event_hub_receiver.value, "event_hub_name", null)
      subscription_id         = lookup(event_hub_receiver.value, "subscription_id", null)
      use_common_alert_schema = lookup(event_hub_receiver.value, "use_common_alert_schema", null)
    }
  }
  dynamic "itsm_receiver" {
    for_each = try(var.itsm_receiver, {})
	content {
      name                 = lookup(itsm_receiver.value, "name", null)
      workspace_id         = lookup(itsm_receiver.value, "workspace_id", null)
      connection_id        = lookup(itsm_receiver.value, "connection_id", null)
      ticket_configuration = lookup(itsm_receiver.value, "ticket_configuration", null)
      region               = lookup(itsm_receiver.value, "region", null)
    }
  }
  dynamic "logic_app_receiver" {
    for_each = try(var.logic_app_receiver, {})
	content {
      name                    = lookup(logic_app_receiver.value, "name", null)
      resource_id             = lookup(logic_app_receiver.value, "resource_id", null)
      callback_url            = lookup(logic_app_receiver.value, "callback_url", null)
      use_common_alert_schema = lookup(logic_app_receiver.value, "use_common_alert_schema", null)
    }
  }
  dynamic "sms_receiver" {
    for_each = try(var.sms_receiver, {})
	content {
      name         = lookup(sms_receiver.value, "name", null)
      country_code = lookup(sms_receiver.value, "country_code", null)
      phone_number = lookup(sms_receiver.value, "phone_number", null)
    }
  }
  dynamic "voice_receiver" {
    for_each = try(var.voice_receiver,{})
	content {
      name         = lookup(voice_receiver.value, "name", null)
      country_code = lookup(voice_receiver.value, "country_code", null)
      phone_number = lookup(voice_receiver.value, "phone_number", null)
    }
  }

  dynamic "webhook_receiver" {
    for_each = try(var.webhook_receiver, {})
	content {
      name                    = lookup(webhook_receiver.value, "name", null)
      service_uri             = lookup(webhook_receiver.value, "service_uri", null)
      use_common_alert_schema = lookup(webhook_receiver.value, "use_common_alert_schema", null)
    }
  }  
}

# outputs 
output "id" {
  value       = azurerm_monitor_action_group.this.id
  description = "The ID of the Action Group."
}