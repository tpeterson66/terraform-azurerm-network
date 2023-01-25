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