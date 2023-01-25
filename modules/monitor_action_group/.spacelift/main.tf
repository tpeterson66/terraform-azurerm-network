provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-monitoractiongroup"
  location = "EastUS"
}

# // monitor action group
module "monitor_action_group" {
  source                       = "../"
  name                         = "spacelift-monitoractiongroup"
  resource_group_name          = azurerm_resource_group.rg.name
  short_name                   = "test"
}

# // monitor action group
module "monitor_action_group_email" {
  source                       = "../"
  name                         = "spacelift-monitoractiongroupemail"
  resource_group_name          = azurerm_resource_group.rg.name
  short_name                   = "email"
  email_settings               = [{name = "ahmed", email_address = "ahmed.babic@coretek.com", use_common_alert_schema = true}]
}

# // monitoraction group
module "monitor_action_group_default" {
  source                       = "../"
  name                         = "spacelift-monitoractiongroupdefault"
  resource_group_name          = azurerm_resource_group.rg.name
  short_name                   = "default"
  arm_role_receiver            = []
  automation_runbook_receiver  = []
  azure_app_push_receiver      = []
  azure_function_receiver      = []
  email_settings               = []
  event_hub_receiver           = []
  itsm_receiver                = []
  logic_app_receiver           = []
  sms_receiver                 = []
  voice_receiver               = []
  webhook_receiver             = []
}