# variables
variable "name" {
  description = "Specifies the Name of the Private link. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "The supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "Specifies the Name of the Resource Group within which the Private link should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "public_ip_name" {
  description = "Specifies the Name of the Public IP"
  type        = string
}
variable "public_ip_sku" {
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = "Basic"
}
variable "allocation_method" {
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = "Dynamic"
}
variable "lb_name" {
  description = "Specifies the Name of the Load Balancer. Changing this forces a new resource to be created."
  type        = string
}
variable "lb_sku"{
  description = "The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic."
  type        = string
  default     = "Basic"
}
variable "subnet_id" {
  description = "Private Link Subnet Id"
  type        = string
}
variable "primary"{
  description = "Is this is the Primary IP Configuration? Changing this forces a new resource to be created."
  type        = bool
}


# resources

# public ip
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  sku                 = var.public_ip_sku
  location            = var.location
  resource_group_name = var.resource_group
  allocation_method   = var.allocation_method
}

# load balancer
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb
resource "azurerm_lb" "this" {
  name                = var.lb_name
  sku                 = var.lb_sku
  location            = var.location
  resource_group_name = var.resource_group

  frontend_ip_configuration {
    name                 = azurerm_public_ip.this.name
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

# private link service
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_link_service
resource "azurerm_private_link_service" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group

  nat_ip_configuration {
    name      = azurerm_public_ip.this.name
    primary   = var.primary
    subnet_id = var.subnet_id
  }

  load_balancer_frontend_ip_configuration_ids = [
    azurerm_lb.this.frontend_ip_configuration.0.id,
  ]
}


# outputs
output "id" {
  value = azurerm_private_link_service.this.id
}
