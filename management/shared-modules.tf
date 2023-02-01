# Shared modules - root space only

module "route_table" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-route_table"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Route Table"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/route_table"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "static_site" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-static_site"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Static Site"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/static_site"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "application_gateway" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-application_gateway"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Application Gateway"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/application_gateway"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "application_insights_workbook" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-application_insights_workbook"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Application Insights Workbook"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/application_insights_workbook"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "availability_set" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-availability_set"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Availability Set"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/availability_set"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "bastion" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-bastion"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Bastion"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/bastion"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "container_group" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-container_group"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Container Group"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/container_group"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "express_route_circuit" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-express_route_circuit"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Express Route Circuit"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/express_route_circuit"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "function_app_linux" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-function_app_linux"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Function App Linux"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/function_app_linux"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "function_app_windows" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-function_app_windows"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Function App Windows"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/function_app_windows"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "load_balancer" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-load_balancer"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Load Balancer"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/load_balancer"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "load_balancer_gateway" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-load_balancer_gateway"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Load Balancer Gateway"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/load_balancer_gateway"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "load_balancer_internal" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-load_balancer_internal"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Load Balancer Internal"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/load_balancer_internal"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "monitor_action_group" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-monitor_action_group"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Monitor Action Group"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/monitor_action_group"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "monitor_diagnostic_setting" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-diagnostic_setting"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Monitor Diagnostic Setting"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/monitor_diagnostic_setting"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "monitor_metric_alert" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-monitor_metric_alert"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Monitor Metric Alert"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/monitor_metric_alert"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "mssql_database" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-mssql_database"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure MS SQL Database"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/mssql_database"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "mssql_server" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-mssql_server"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure MS SQL Server"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/mssql_server"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "nat_gateway" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-nat_gateway"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure NAT Gateway"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/nat_gateway"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "network_security_group" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-network_security_group"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Network Security Group"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/network_security_group"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "network_security_rule" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-network_security_rule"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Network Security Rule"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/network_security_rule"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "portal_dashboard" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-portal_dashboard"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Portal Dashboard"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/portal_dashboard"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "private_endpoint" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-private_endpoint"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Private Endpoint"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/private_endpoint"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}

module "private_link" {
  source               = "./modules/module"
  name                 = "terraform-azurerm-private_link"
  space_id             = data.spacelift_space.root.id
  branch               = "main"
  description          = "Azure Private Link"
  repository           = "terraform-azurerm-network"
  project_root         = "modules/private_link"
  namespace            = "tpeterson66"
  azure_integration_id = data.spacelift_azure_integration.module.id
  write_permission     = true
  read_permission      = true
  azure_subscription   = var.module_subscription_id
}