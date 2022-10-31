terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
provider "azurerm"  {
  features {}
}

# variables
variable "name" {
  description = "Specifies the name of the Load Balancer. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "Specifies the supported Azure location where the Load Balancer should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Load Balancershould exist. Changing this forces a new resource to be created."
  type        = string
}
variable "public_ip_name" {
  description = "Specifies the name of the public IP. Changing this forces a new resource to be created."
  type        = string
}
variable "allocation_method"{
  description = "Allocation method for IP configuration. (Options: 1. [Static] 2. Dynamic)."
  type        = string
  default     = "Static"
}
variable "frontend_ip_configuration_name" {
  description = "Specifies the name of the public IP. Changing this forces a new resource to be created."
  type        = string
}

# resources
# public ip
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
}
# load balancer
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb
resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

#outputs
output "id" {
  value       = azurerm_lb.this.id
  description = "The Load Balancer ID."
}
output "frontend_ip_configuration" {
  value       = azurerm_lb.this.frontend_ip_configuration
  description = "A `frontend_ip_configuration` block"
}
output "private_ip_address" {
  value       = azurerm_lb.this.private_ip_address
  description = "The first private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any."
}
output "private_ip_addresses" {
  value       = azurerm_lb.this.private_ip_addresses
  description = "The list of private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any."
}