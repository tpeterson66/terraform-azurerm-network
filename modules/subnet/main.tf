terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}

# variables
variable "name" {
    type = string
    description = "The name of the subnet"
}

variable "resource_group_name" {
    type = string
    description = "The resource group for the resource"
}

variable "virtual_network_name" {
    type = string
    description = "Name of the virtual network"
}

variable "address_prefixes" {
    type = list(string)
    description = "The subnet address prefix"
}

variable "service_endpoints" {
    type = list(string)
    description = "List of service endpoints"
}

variable "enforce_private_link_endpoint_network_policies" {
    type = bool
    description = "Enforce private link policies"
}

variable "enforce_private_link_service_network_policies" {
    type = bool
    description = "Enforce network policies"
}

variable "settings" {
    default = {
        delegation = {
            name = "delegation"
            service_delegation = "Microsoft.ContainerInstance/containerGroups"
            actions = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"]
        }
    }
}

# resources
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet
resource "azurerm_subnet" "subnet" {

  name                                           = var.name
  resource_group_name                            = var.resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = var.address_prefixes
  service_endpoints                              = var.service_endpoints
  enforce_private_link_endpoint_network_policies = try(var.enforce_private_link_endpoint_network_policies, false)
  enforce_private_link_service_network_policies  = try(var.enforce_private_link_service_network_policies, false)

  dynamic "delegation" {
    for_each = try(var.settings.delegation, null) == null ? [] : [1]

    content {
      name = var.settings.delegation.name

      service_delegation {
        name    = var.settings.delegation.service_delegation
        actions = lookup(var.settings.delegation, "actions", null)
      }
    }
  }

  lifecycle {
    ignore_changes = [name]
  }

}

# outputs