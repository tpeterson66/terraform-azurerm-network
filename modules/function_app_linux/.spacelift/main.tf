provider "azurerm" {
  features {}
}

# // function app linux
module "function_app_linux" {
  source                       = "../"
  name                         = "spacelift-function-app-linux"
  location                     = "EastUS"
  resource_group_name          = "spacelift-test-modules"
  service_plan_id              = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Web/serverfarms/spacelift-test-serviceplanlinux"
  storage_account_name         = "ahmedbstorageaccount"
  storage_account_access_key   = "Np7Qr+WFcrKm9eCrL+6DwGb3aYxZzAS87V5UjK9e/ej9MkrFWz1RedXh0F2E7CLBRC9nYRXrzinu+AStSNUEfg=="
  elastic_instance_minimum     = "2"
  enable_diagnostics           = false
  log_analytics_workspace_id   = ""
  enable_metric_alerts         = false
  metric_alerts                = [  ]
  action_group_id              = ""

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // function app linux with diagnostic settings
module "function_app_linux_diagnostic" {
  source                       = "../"
  name                         = "spacelift-function-app-linux-diagnostic"
  location                     = "EastUS"
  resource_group_name          = "spacelift-test-modules"
  service_plan_id              = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Web/serverfarms/spacelift-test-serviceplanlinux"
  storage_account_name         = "ahmedbstorageaccount"
  storage_account_access_key   = "Np7Qr+WFcrKm9eCrL+6DwGb3aYxZzAS87V5UjK9e/ej9MkrFWz1RedXh0F2E7CLBRC9nYRXrzinu+AStSNUEfg=="
  elastic_instance_minimum     = "2"
  enable_diagnostics           = true
  log_analytics_workspace_id   = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.OperationalInsights/workspaces/spacelift-test-loganalyticsworkspace"
  enable_metric_alerts         = false
  metric_alerts                = [  ]
  action_group_id              = ""

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

# // function app linux with diagnostic settings
module "function_app_linux_diagnostic" {
  source                       = "../"
  name                         = "spacelift-function-app-linux-diagnostic"
  location                     = "EastUS"
  resource_group_name          = "spacelift-test-modules"
  service_plan_id              = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Web/serverfarms/spacelift-test-serviceplanlinux"
  storage_account_name         = "ahmedbstorageaccount"
  storage_account_access_key   = "Np7Qr+WFcrKm9eCrL+6DwGb3aYxZzAS87V5UjK9e/ej9MkrFWz1RedXh0F2E7CLBRC9nYRXrzinu+AStSNUEfg=="
  elastic_instance_minimum     = "2"
  enable_diagnostics           = true
  log_analytics_workspace_id   = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.OperationalInsights/workspaces/spacelift-test-loganalyticsworkspace"
  enable_metric_alerts         = false
  metric_alerts                = [  ]
  action_group_id              = ""

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}