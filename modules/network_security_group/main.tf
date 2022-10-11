# variables
variable "name" {
  description = "A name for network security group"
  type        = string
}
variable "location" {
  description = "Azure location where network security group will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the network security group."
  type        = string
}
variable "security_rule_name" {
  description = "The name of the security rule that is used in network security group"
  type        = string
}
variable "security_rule_priority" {
  description = "Specifies the priority of the rule. The value can be between 100 and 4096 and must be unique for each rule in the collection. (Lower priority number -> Higher priority)."
  type        = number
}
variable "security_rule_direction" {
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
  type        = string
}
variable "security_rule_access" {
  description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
  type        = string
}
variable "security_rule_protocol" {
  description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all)."
  type        = string
}

# resources

# network security group
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  security_rule {
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = var.security_ruke_access
    protocol                   = var.security_rule_protocol
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# outputs
output "id" {
  value = azurerm_network_security_group.this.id
}