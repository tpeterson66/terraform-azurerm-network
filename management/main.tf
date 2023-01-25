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

resource "spacelift_module" "route_table" {
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