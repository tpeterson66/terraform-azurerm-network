provider "azurerm" {
  features {}
}
// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-monitormetricalert"
  location = "EastUS"
}

# // monitor metric alert
module "monitor_metric_alert" {
  source                       = "../"
  resource_group_name          = azurerm_resource_group.rg.name
  action_group_id              = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-monitoractiongroup/providers/microsoft.insights/actionGroups/spacelift-monitoractiongroupemail"
  enable_metric_alerts         = true
  scopes                       = ["/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/70b39799-9051-4868-8e8c-489667212901/providers/Microsoft.Storage/storageAccounts/ahmedbstorageaccount"]
  metric_alerts = [{
    name               = "spacelift-monitormetricalert"
    metric_namespace   = "Microsoft.Storage/storageAccounts"
    metric_name        = "Transactions"
    aggregation        = "Total"
    operator           = "GreaterThan"
    threshold          = "0"
    dimension_name     = "ApiName"
    dimension_operator = "Include"
    dimension_values   = ["*"]
  }] 
}
