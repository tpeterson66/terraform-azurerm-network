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
| [azurerm_network_security_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/network_security_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access"></a> [access](#input\_access) | Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny. | `string` | n/a | yes |
| <a name="input_destination_address_prefix"></a> [destination\_address\_prefix](#input\_destination\_address\_prefix) | CIDR or destination IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. Besides, it also supports all available Service Tags like ‘Sql.WestEurope‘, ‘Storage.EastUS‘, etc. You can list the available service tags with the CLI: shell az network list-service-tags --location westcentralus | `string` | n/a | yes |
| <a name="input_destination_port_range"></a> [destination\_port\_range](#input\_destination\_port\_range) | Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination\_port\_ranges is not specified. | `string` | n/a | yes |
| <a name="input_direction"></a> [direction](#input\_direction) | The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where network security group will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for network security group | `string` | n/a | yes |
| <a name="input_network_security_group_name"></a> [network\_security\_group\_name](#input\_network\_security\_group\_name) | The name of the Network Security Group that we want to attach the rule to. | `string` | n/a | yes |
| <a name="input_priority"></a> [priority](#input\_priority) | Specifies the priority of the rule. The value can be between 100 and 4096 and must be unique for each rule in the collection. (Lower priority number -> Higher priority). | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or * (which matches all). | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the network security rule. | `string` | n/a | yes |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | CIDR or source IP range or * to match any IP. Tags such as ‘VirtualNetwork’, ‘AzureLoadBalancer’ and ‘Internet’ can also be used. This is required if source\_address\_prefixes is not specified. | `string` | n/a | yes |
| <a name="input_source_port_range"></a> [source\_port\_range](#input\_source\_port\_range) | Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source\_port\_ranges is not specified. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->