terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.0.2"
    }
  }
}

provider "spacelift" {
  # Configuration options
}

# root space
data "spacelift_space" "root" {
  space_id = "root"
}

# Coretk Space
resource "spacelift_space" "coretek" {
  name             = "coretek"
  inherit_entities = true
}