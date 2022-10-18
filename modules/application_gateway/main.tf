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

#variables
variable "name" {
  description = "The name of the Application Gateway. Changing this forces a new resource to be created."
  type        = string
}
variable "location" {
  description = "The Azure region where the Application Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to the Application Gateway should exist. Changing this forces a new resource to be created."
  type        = string
}
variable "application_gateway_sku" {
  description = "The Name of the SKU to use for this Application Gateway. Possible values are Standard_Small, Standard_Medium, Standard_Large, Standard_v2, WAF_Medium, WAF_Large, and WAF_v2."
  type        = string
}
variable "application_gateway_tier" {
  description = "The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard_v2, WAF and WAF_v2.."
  type        = string
}
variable "application_gateway_capacity" {
  description = "The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale_configuration is set."
  type        = string
}
variable "gateway_ip_configuration_subnet_id" {
  description = "The ID of the Subnet which the Application Gateway should be connected to."
  type        = string
}
variable "private_ip_address" {
  description = "The Private IP Address to use for the Application Gateway."
  type        = string
}
variable "public_ip_name" {
  description = "Name of the public IP address used by the Application Gateway"
  type        = string
}
variable "public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
}
variable "allocation_method" {
  description = "Allocation method of public IP. Accepted values are Dynamic and Static. Public IP Standard SKUs require allocation_method to be set to Static."
  type        = string
}
variable "private_ip_address_allocation" {
  description = "The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  type        = string
}
variable "user_assigned_identity_name" {
  description = "The name of the user assigned identity. Changing this forces a new identity to be created."
  type        = string
}
variable "rule_type" {
  description = "The Type of Routing that should be used for this Rule. Possible values are [Basic] and PathBasedRouting."
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}

# resources
# public ip
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "AppGw" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  tags                = var.tags
}
# user assigned identity
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity
resource "azurerm_user_assigned_identity" "AppGw" {
  name                = var.user_assigned_identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
}
# aplication gateway
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_gateway
resource "azurerm_application_gateway" "AppGw" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  lifecycle {
    ignore_changes = [
      backend_http_settings,
      http_listener,
      request_routing_rule,
      backend_address_pool,
      frontend_port,
      probe,
      tags
    ]
  }
  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.AppGw.id]
  }

  sku {
    name     = var.application_gateway_sku
    tier     = var.application_gateway_tier
    capacity = var.application_gateway_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.gateway_ip_configuration_subnet_id
  }

  frontend_port {
    name = "${var.name}-feport"
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  frontend_ip_configuration {
    name                 = "${var.name}-public-feip"
    public_ip_address_id = azurerm_public_ip.AppGw.id
  }

  frontend_ip_configuration {
    name                          = "${var.name}-private-feip"
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
    subnet_id                     = var.gateway_ip_configuration_subnet_id
  }

  backend_address_pool {
    name = "${var.name}-beap"
  }

  backend_http_settings {
    name                  = "${var.name}-be-htst"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${var.name}-httplstn"
    frontend_ip_configuration_name = "${var.name}-private-feip"
    frontend_port_name             = "${var.name}-feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${var.name}-rqrt"
    rule_type                  = var.rule_type
    http_listener_name         = "${var.name}-httplstn"
    backend_address_pool_name  = "${var.name}-beap"
    backend_http_settings_name = "${var.name}-be-htst"
    priority                   = 2
  }

  depends_on = [
    azurerm_public_ip.AppGw,
  ]
  tags = var.tags
}

output "id" {
  value = azurerm_application_gateway.AppGw.id
}
output "principal_id" {
  value = azurerm_user_assigned_identity.AppGw.principal_id
}
output "public_ip_address" {
  value = azurerm_public_ip.AppGw.ip_address
}
output "private_ip_address" {
  value = azurerm_application_gateway.AppGw.frontend_ip_configuration[1].private_ip_address
}