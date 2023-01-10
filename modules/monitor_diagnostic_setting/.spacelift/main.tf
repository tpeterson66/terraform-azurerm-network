provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-monitordiagnosticsetting"
  location = "EastUS"
}

# // monitor diagnostic setting
module "monitor_diagnostic_setting" {
  source                     = "../"
  name                       = "spacelift-monitordiagnosticsetting"
  log_analytics_workspace_id = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.OperationalInsights/workspaces/spacelift-loganalytics-workspace"
  target_resource_id         = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules-nsg/providers/Microsoft.Network/networkSecurityGroups/spacelift-nsg"
  enable_diagnostics         = true 
}