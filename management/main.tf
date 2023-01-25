terraform {
  required_providers {
    spacelift = {
      source = "spacelift-io/spacelift"
      version = "1.0.2"
    }
  }
}

provider "spacelift" {
  # Configuration options
}

# Coretk Space
resource "spacelift_space" "coretek" {
  name = "coretek"
  inherit_entities = true
}

# Module Management Space
resource "spacelift_space" "modules" {
  name = "coretek-modules"
  parent_space_id = spacelift_space.coretek.id
  inherit_entities = true
}

module "route_table" {
  source = "./modules/module"
  name           = "terraform-azurerm-route_table"
  space_id       = spacelift_space.modules.id
  administrative = false
  branch         = "main"
  description    = "Azure Route Table"
  repository     = "terraform-azurerm-network"
  project_root   = "modules/route_table"
  github_enterprise {
    namespace = "tpeterson66"
  }
}

module "static_site" {
  source = "./modules/module"
  name           = "terraform-azurerm-static_site"
  space_id       = spacelift_space.modules.id
  administrative = false
  branch         = "main"
  description    = "Azure Static Site"
  repository     = "terraform-azurerm-network"
  project_root   = "modules/static_site"
  github_enterprise {
    namespace = "tpeterson66"
  }
}