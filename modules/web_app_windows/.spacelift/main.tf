provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-web-app-windows"
  location = "EastUS"
}

// service plan
module "service_plan" {
  source              = "../../service_plan"
  name                = "spacelift-serviceplan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Windows"
  sku_name            = "B1"
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

// Windows web app with default values
module "windows_web_app" {
  source              = "../"
  name                = "spacelift-windows-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = module.service_plan.id
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  header_frontdoor_id = "f4217b30-81df-414c-ab42-eb9591c8e6dd"
  firewall_ip         = "10.0.0.0"
  app_command_line    = "start"
}

// Windows web app with custom values
module "windows_web_app_custom" {
  source              = "../"
  name                = "spacelift-windows-web-app-custom"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = module.service_plan.id
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  header_frontdoor_id = "f4217b30-81df-414c-ab42-eb9591c8e6dd"
  firewall_ip         = "10.0.0.0"
  app_command_line    = "start"
  app_settings = {
    APPINSIGHTS_PROFILERFEATURE_VERSION             = "1.0.0"
    APPINSIGHTS_SNAPSHOTFEATURE_VERSION             = "1.0.0"
    DiagnosticServices_EXTENSION_VERSION            = "~3"
    InstrumentationEngine_EXTENSION_VERSION         = "disabled"
    SnapshotDebugger_EXTENSION_VERSION              = "disabled"
    XDT_MicrosoftApplicationInsights_BaseExtensions = "disabled"
    XDT_MicrosoftApplicationInsights_Java           = "1"
    XDT_MicrosoftApplicationInsights_Mode           = "recommended"
    XDT_MicrosoftApplicationInsights_NodeJS         = "1"
    XDT_MicrosoftApplicationInsights_PreemptSdk     = "disabled"
  }
  connection_strings = [{ name = "testconnectionstring", type = "SQLAzure", value = "test" }]
}