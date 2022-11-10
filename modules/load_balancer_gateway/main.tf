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
  description = "Specifies the name of the Load Balancer."
  type        = string
}
variable "location" {
  description = "Specifies the supported Azure location where the Load Balancer should exist."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the name of the Resource Group in which the Load Balancershould exist."
  type        = string
}
variable "frontend_ip_configuration_name" {
  description = "Specifies the name of the public IP."
  type        = string
}
variable "subnet_id" {
  description = "Subnet ID for Load Balancer frontend ip configuration"
  type        = string
}

# resources
# load balancer
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb
resource "azurerm_lb" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Gateway"

  frontend_ip_configuration {
    name                          = var.frontend_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}
# lb backend address pool 
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool_address
resource "azurerm_lb_backend_address_pool" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = "${var.name}_backend_address_pool"
  tunnel_interface { # if you change the tunnel interface data, you will need to update the custom data!
    identifier = "800"
    type       = "Internal"
    protocol   = "VXLAN"
    port       = "2000"
  }
  tunnel_interface {
    identifier = "801"
    type       = "External"
    protocol   = "VXLAN"
    port       = "2001"
  }
}
# lb probe
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe
resource "azurerm_lb_probe" "this" {
  loadbalancer_id = azurerm_lb.this.id
  name            = "${var.name}_probe"
  port            = 22
}
# lb rule
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule
resource "azurerm_lb_rule" "this" {
  loadbalancer_id                = azurerm_lb.this.id
  name                           = "${var.name}_rule"
  protocol                       = "All"
  frontend_port                  = 0
  backend_port                   = 0
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = azurerm_lb_probe.this.id
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.this.id]
}

#outputs
output "id" {
  value       = azurerm_lb.this.id
  description = "The Load Balancer ID."
}
output "lb_backend_address_pool_id" {
  value       = azurerm_lb_backend_address_pool.this.id
  description = "The Load Balancer Backend Address Pool ID."
}
output "lb_probe_id" {
  value       = azurerm_lb_probe.this.id
  description = "The Load Balancer Probe ID."
}
output "lb_rule_id" {
  value       = azurerm_lb_rule.this.id
  description = "The Load Balancer Rule ID."
}
output "frontend_ip_configuration" {
  value       = azurerm_lb.this.frontend_ip_configuration
  description = "A `frontend_ip_configuration` block"
}
output "private_ip_address" {
  value       = azurerm_lb.this.private_ip_address
  description = "The first private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any."
}