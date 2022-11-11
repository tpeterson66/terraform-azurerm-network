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
| [azurerm_express_route_circuit.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/express_route_circuit) | resource |
| [azurerm_express_route_circuit_peering.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/express_route_circuit_peering) | resource |
| [azurerm_express_route_port.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/express_route_port) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_in_gbps"></a> [bandwidth\_in\_gbps](#input\_bandwidth\_in\_gbps) | Bandwidth of the Express Route Port in Gbps. | `string` | n/a | yes |
| <a name="input_bandwidth_in_mbps"></a> [bandwidth\_in\_mbps](#input\_bandwidth\_in\_mbps) | The bandwidth in Mbps of the circuit being created on the Service Provider.Once you increase your bandwidth, you will not be able to decrease it to its previous value. | `string` | n/a | yes |
| <a name="input_encapsulation"></a> [encapsulation](#input\_encapsulation) | The encapsulation method used for the Express Route Port. Possible values are: Dot1Q, QinQ. | `string` | n/a | yes |
| <a name="input_ipv4_enabled"></a> [ipv4\_enabled](#input\_ipv4\_enabled) | A boolean value indicating whether the IPv4 peering is enabled. Defaults to true. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Azure ExpressRoute Circuit will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Azure ExpressRoute Circuit | `string` | n/a | yes |
| <a name="input_peer_asn"></a> [peer\_asn](#input\_peer\_asn) | The Either a 16-bit or a 32-bit ASN. Can either be public or private. | `number` | n/a | yes |
| <a name="input_peering_location"></a> [peering\_location](#input\_peering\_location) | The name of the peering location and not the Azure resource location. | `string` | n/a | yes |
| <a name="input_peering_type"></a> [peering\_type](#input\_peering\_type) | The type of the ExpressRoute Circuit Peering. Acceptable values include [AzurePrivatePeering], AzurePublicPeering and MicrosoftPeering | `string` | `"AzurePrivatePeering"` | no |
| <a name="input_port_name"></a> [port\_name](#input\_port\_name) | The name of the Azure ExpressRoute Port | `string` | n/a | yes |
| <a name="input_primary_peer_address_prefix"></a> [primary\_peer\_address\_prefix](#input\_primary\_peer\_address\_prefix) | A /30 subnet for the primary link. Required when config for IPv4. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Azure Resource Group Name for management | `string` | n/a | yes |
| <a name="input_secondary_peer_address_prefix"></a> [secondary\_peer\_address\_prefix](#input\_secondary\_peer\_address\_prefix) | A /30 subnet for the secondary link. Required when config for IPv4. | `string` | n/a | yes |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | The name of the ExpressRoute Service Provider. | `string` | n/a | yes |
| <a name="input_sku_family"></a> [sku\_family](#input\_sku\_family) | The billing mode for bandwidth. Possible values are [MeteredData] or UnlimitedData. | `string` | `"MeteredData"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The service tier. Possible values are Basic, Local, Standard or Premium. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_vlan_id"></a> [vlan\_id](#input\_vlan\_id) | A valid VLAN ID to establish this peering on. | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of Azure ExpressRoute Circuit. |
| <a name="output_name"></a> [name](#output\_name) | Name of Azure ExpressRoute Circuit. |
| <a name="output_peering_id"></a> [peering\_id](#output\_peering\_id) | ID of Azure ExpressRoute Circuit Peering. |
| <a name="output_port_id"></a> [port\_id](#output\_port\_id) | ID of Azure ExpressRoute Port. |
| <a name="output_port_name"></a> [port\_name](#output\_port\_name) | Name of Azure ExpressRoute Port. |
| <a name="output_service_provider_provisioning_state"></a> [service\_provider\_provisioning\_state](#output\_service\_provider\_provisioning\_state) | Azure ExpressRoute Circuit service\_provider\_provisioning\_state post creation |
<!-- END_TF_DOCS -->