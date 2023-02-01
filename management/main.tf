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


variable "module_integration_id" {
  type        = string
  default     = "01GR548ZCK34J9CFJ15YT96WB3"
  description = "The spacelift integration ID for modules"
}

variable "smartcloud_integration_id" {
  type        = string
  default     = "01GR548ZCK34J9CFJ15YT96WB3"
  description = "The spacelift integration ID for smartcloud"
}

variable "module_subscription_id" {
  type        = string
  default     = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
  description = "The subscription used for module testing"

}
data "spacelift_azure_integration" "module" {
  integration_id = var.module_integration_id
}
data "spacelift_azure_integration" "smartcloud" {
  integration_id = var.smartcloud_integration_id
}

# Coretk Space
resource "spacelift_space" "coretek" {
  name             = "coretek"
  inherit_entities = true
}