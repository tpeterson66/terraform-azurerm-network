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
variable "security_rule_source_port_range" {
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
  type        = string
}
variable "security_rule_destination_port_range" {
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
  type        = string
}
variable "security_rule_source_address_prefix" {
  description = "CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified."
  type        = string
}
variable "security_rule_destination_address_prefix" {
  description = "CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus"
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

# network security rule
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule
  security_rule {
    name                       = var.security_rule_name
    priority                   = var.security_rule_priority
    direction                  = var.security_rule_direction
    access                     = var.security_ruke_access
    protocol                   = var.security_rule_protocol
    source_port_range          = var.security_rule_source_port_range
    destination_port_range     = var.security_rule_destination_port_range
    source_address_prefix      = var.security_rule_source_address_prefix
    destination_address_prefix = var.security_rule_destination_address_prefix
  }
}

# outputs
output "id" {
  value = azurerm_network_security_group.this.id
}