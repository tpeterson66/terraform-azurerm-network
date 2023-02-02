# provider details
terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.0.2"
    }
  }
}

# provider
provider "spacelift" {
  # Configuration options
}

# data for root space
data "spacelift_space" "root" {
  space_id = "root"
}

# integration used for module testing
variable "module_integration_id" {
  type        = string
  default     = "01GR548ZCK34J9CFJ15YT96WB3"
  description = "The spacelift integration ID for modules"
}

# integration used for smartcloud; currently the same, may be different one day
variable "smartcloud_integration_id" {
  type        = string
  default     = "01GR548ZCK34J9CFJ15YT96WB3"
  description = "The spacelift integration ID for smartcloud"
}

# subscription used for module testing
variable "module_subscription_id" {
  type        = string
  default     = "c759eb32-e9c8-4e19-9f2f-d036cf250f5c"
  description = "The subscription used for module testing"
}

# data resource for module integration
data "spacelift_azure_integration" "module" {
  integration_id = var.module_integration_id
}

# data for smartcloud integration
data "spacelift_azure_integration" "smartcloud" {
  integration_id = var.smartcloud_integration_id
}

