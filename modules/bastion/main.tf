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
  description = "A name for Bastion host"
  type        = string
}
variable "location" {
  description = "Azure location where Bastion host will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Bastion Host."
  type        = string
}
variable "public_ip_name" {
  description = "Bastion host public IP name"
  type        = string
}
variable "subnet_id" {
  description = "Reference to a subnet in which this Bastion Host has been created.The name must be exactly 'AzureBastionSubnet' to be used for the Azure Bastion Host resource"
  type        = string
}
variable "ip_configuration_name" {
  description = "A name for ip configuration"
  type        = string
}
variable "allocation_method" {
  description = "Allocation method for IP configuration. (Options: 1. [Static] 2. Dynamic)."
  type        = string
  default     = "Static"
}
variable "sku" {
  description = "The SKU of the Public IP. (Options: 1. [Basic] 2. Standard)."
  type        = string
  default     = "Standard"
}

# resources

# public ip
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip
resource "azurerm_public_ip" "this" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.sku
}
# bastion host
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host
resource "azurerm_bastion_host" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = var.subnet_id
    public_ip_address_id = azurerm_public_ip.this.id
  }
}

# outputs
