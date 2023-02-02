# terraform {
#   required_providers {
#     spacelift = {
#       source  = "spacelift-io/spacelift"
#       version = "1.0.2"
#     }
#   }
# }

# provider "spacelift" {
#   # Configuration options
# }

variable "name" {
  type        = string
  description = "The name of the module"
}
variable "space_id" {
  type        = string
  description = "The space ID for the module"
}
variable "branch" {
  type        = string
  default     = "main"
  description = "The branch to watch for changes"
}
variable "description" {
  type        = string
  description = "The module description"
}
variable "repository" {
  type        = string
  description = "The repo which contains the module"
}
variable "project_root" {
  type        = string
  description = "path to the module folder"
}
variable "namespace" {
  type        = string
  description = "the github namespace"
}

variable "azure_integration_id" {
  type        = string
  description = "The ID of the azure integration for the module"
}

variable "azure_subscription" {
  type        = string
  description = "The subscription ID for module testing"
}

variable "write_permission" {
  type        = bool
  default     = false
  description = "Does the module integration require write permissions"
}
variable "read_permission" {
  type        = bool
  default     = true
  description = "Does the module integration require write permissions"
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

# attach integration
resource "spacelift_azure_integration_attachment" "readWrite" {
  integration_id  = var.azure_integration_id
  stack_id        = spacelift_module.this.id
  read            = var.read_permission
  write           = var.write_permission
  subscription_id = var.azure_subscription
}