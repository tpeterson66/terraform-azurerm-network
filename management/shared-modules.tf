# Shared modules - root space only

module "route_table" {
  source   = "./modules/module"
  name     = "terraform-azurerm-route_table"
  space_id = data.spacelift_space.root.id
  branch       = "main"
  description  = "Azure Route Table"
  repository   = "terraform-azurerm-network"
  project_root = "modules/route_table"
  namespace    = "tpeterson66"
}

module "static_site" {
  source         = "./modules/module"
  name           = "terraform-azurerm-static_site"
  space_id       = data.spacelift_space.root.id
  branch         = "main"
  description    = "Azure Static Site"
  repository     = "terraform-azurerm-network"
  project_root   = "modules/static_site"
  namespace      = "tpeterson66"
}