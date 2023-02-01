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