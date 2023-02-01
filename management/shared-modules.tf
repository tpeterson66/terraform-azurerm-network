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
  azure_subscription      = var.module_subscription_id
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
  azure_subscription      = var.module_subscription_id
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