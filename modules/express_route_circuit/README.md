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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_in_mbps"></a> [bandwidth\_in\_mbps](#input\_bandwidth\_in\_mbps) | The bandwidth in Mbps of the circuit being created on the Service Provider.Once you increase your bandwidth, you will not be able to decrease it to its previous value. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the ExpressRoute circuit will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the ExpressRoute circuit | `string` | n/a | yes |
| <a name="input_peering_location"></a> [peering\_location](#input\_peering\_location) | The name of the peering location and not the Azure resource location. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Azure Resource Group Name for management | `string` | n/a | yes |
| <a name="input_service_provider_name"></a> [service\_provider\_name](#input\_service\_provider\_name) | The name of the ExpressRoute Service Provider. | `string` | n/a | yes |
| <a name="input_sku_family"></a> [sku\_family](#input\_sku\_family) | The billing mode for bandwidth. Possible values are [MeteredData] or UnlimitedData. | `string` | `"MeteredData"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The service tier. Possible values are Basic, Local, Standard or Premium. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of Azure Express Route Circuit. |
| <a name="output_name"></a> [name](#output\_name) | Name of Azure Express Route Circuit. |
<!-- END_TF_DOCS -->