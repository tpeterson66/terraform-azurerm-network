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
  description = "Specifies the supported Azure location where the Load Balancer should exist."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Load Balancershould exist."
  type        = string
}
variable "sku" {
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic."
  type        = string
  default     = "Standard"
}
variable "allocation_method"{
  description = "Allocation method for IP configuration. (Options: 1. [Static] 2. Dynamic)."
  type        = string
}
variable "frontend_ip_configuration_name" {
  description = "Specifies the name of the public IP. Changing this forces a new resource to be created."
  type        = string
}
variable "backend_pool_name" {
  type        = string
  description = "Load balancer backend pool name"
}
variable "subnet_id" {
  type        = string
  description = "Associated subnet ID"
}

# resources
# load balancer
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb
resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.allocation_method
    private_ip_address_version    = "IPv4"
  }
}
# lb backend address pool
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/lb_backend_address_pool
resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = var.backend_pool_name
}
# lb rule
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/lb_rule
resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = "HealthProbeRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  backend_address_pool_ids        = [azurerm_lb_backend_address_pool.this.id]
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = azurerm_lb_probe.this.id
}
# lb probe
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe
resource "azurerm_lb_probe" "this" {
  loadbalancer_id     = azurerm_lb.this.id
  name                = "${var.name}-HealthProbe"
  protocol            = "Http"
  port                = 80
  request_path        = "/"
}

# outputs
output "lb_id" {
  value       = azurerm_lb.this.id
  description = "Load Balancer ID"
}
output "lb_name" {
  value       = azurerm_lb.this.name
  description = "Load Balancer Name"
}
output "lb_backend_address_pool_id" {
  value       = azurerm_lb_backend_address_pool.this.id
  description = "Load Balancer Backend Address Pool ID"
}
output "lb_backend_address_pool_name" {
  value       = azurerm_lb_backend_address_pool.this.name
  description = "Load Balancer Backend Address Pool Name"
}
output "lb_prob_id" {
  value       = azurerm_lb_probe.this.id
  description = "Health Probe ID"
}
output "lb_prob_name" {
  value       = azurerm_lb_probe.this.name
  description = "Health Probe Name"
} 