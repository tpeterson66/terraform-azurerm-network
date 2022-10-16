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
  description = "A name for network security group"
  type        = string
}
variable "location" {
  description = "Azure location where network security group will be deployed"
  type        = string
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security rule."
  type        = string
}
variable "network_security_group_name" {
  description = " The name of the Network Security Group that we want to attach the rule to."
  type        = string
}
variable "rule_priority" {
  description = "Specifies the priority of the rule. The value can be between 100 and 4096 and must be unique for each rule in the collection. (Lower priority number -> Higher priority)."
  type        = number
}
variable "direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
  type        = string
}
variable "access" {
  description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
  type        = string
}
variable "protocol" {
  description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all)."
  type        = string
}
variable "source_port_range" {
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
  type        = string
}
variable "destination_port_range" {
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
  type        = string
}
variable "source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
  type        = string
}
variable "destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus"
  type        = string
}

# resources
# network security rule
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule
resource "azurerm_network_security_rule" "this" {
  name                        = var.name
  priority                    = var.priority
  direction                   = var.direction
  access                      = var.access
  protocol                    = var.protocol
  source_port_range           = var.source_port_range
  destination_port_range      = var.destination_port_range
  source_address_prefix       = var.source_address_prefix
  destination_address_prefix  = var.destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.network_security_group_name
}

# outputs