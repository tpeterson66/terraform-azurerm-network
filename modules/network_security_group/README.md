<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.26.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Azure location where network security group will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for network security group | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security group. | `string` | n/a | yes |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | List of security rules to be added to network security group. | <pre>list(object({<br>    name                       = string # The name for the security rule<br>    priority                   = number # Specifies the priority of the rule. The value can be between 100 and 4096 and must be unique for each rule in the collection. (Lower priority number -> Higher priority).<br>    direction                  = string # The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound.<br>    access                     = string # Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny.<br>    protocol                   = string # Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all).<br>    source_port_range          = string # Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified.<br>    destination_port_range     = string # Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified.<br>    source_address_prefix      = string # CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source_address_prefixes is not specified.<br>    destination_address_prefix = string # CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | outputs |
<!-- END_TF_DOCS -->