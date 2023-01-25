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

variable "name" {
  type = string
  description = "The name of the module"
}
variable "space_id" {
  type = string
  description = "The space ID for the module"
}
variable "branch" {
  type = string
  default = "main"
  description = "The branch to watch for changes"
}
variable "description" {
  type = string
  description = "The module description"
}
variable "repository" {
  type = string
  description = "The repo which contains the module"
}
variable "project_root" {
  type = string
  description = "path to the module folder"
}
variable "namespace" {
  type = string
  description = "the github namespace"
}

resource "spacelift_module" "this" {
  name           = var.name
  space_id       = var.space_id
  administrative = false
  branch         = var.branch
  description    = var.description
  repository     = var.repository
  project_root   = var.project_root
  github_enterprise {
    namespace = var.namespace
  }
}