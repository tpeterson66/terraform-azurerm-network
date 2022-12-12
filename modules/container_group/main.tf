terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
provider "azurerm" {
  features {}
}

# variables
variable "name" {
  description = "A name for a Container group"
  type        = string
}
variable "location" {
  description = "Azure location where Container group will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Container group."
  type        = string
}
variable "os_type" {
  description = "The OS for the container group. Allowed values are Linux and Windows. Changing this forces a new resource to be created."
  type        = string
}
variable "ip_address_type" {
  description = "Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, network_profile_id also needs to be set."
  type        = string
}
variable "restart_policy" {
  description = "Restart policy for the container group. Allowed values are Always, Never, OnFailure. Defaults to Always. Changing this forces a new resource to be created."
  type        = string
}
variable "network_profile_id" {
  description = "Network profile ID for deploying to virtual network."
  type        = string
}
variable "container_name" {
  description = "Specifies the name of the Container. Changing this forces a new resource to be created."
  type        = string
}
variable "container_image" {
  description = "The container image name. Changing this forces a new resource to be created."
  type        = string
}
variable "container_cpu" {
  description = "The required number of CPU cores of the containers. Changing this forces a new resource to be created."
  type        = string
}
variable "container_memory" {
  description = "The required memory of the containers in GB. Changing this forces a new resource to be created."
  type        = string
}
variable "container_port" {
  description = "The port number the container will expose. Changing this forces a new resource to be created."
  type        = string
}
variable "container_protocol" {
  description = "The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created."
  type        = string
}

# resource
# container group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/container_group
resource "azurerm_container_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_address_type     = var.ip_address_type
  os_type             = var.os_type
  restart_policy      = var.restart_policy
  network_profile_id  = var.network_profile_id

  container {
    name   = var.container_name
    image  = var.container_image
    cpu    = var.container_cpu
    memory = var.container_memory

    ports {
      port     = var.container_port
      protocol = var.container_protocol
    }
  }
  tags = var.tags
}

# outputs
output "group_id" {
  description = "ID of the Container Group."
  value       = azurerm_container_group.this.id
}
output "group_name" {
  description = "Name of the Container Group"
  value       = azurerm_container_group.this.name
} 