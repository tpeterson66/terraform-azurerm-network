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
| [azurerm_virtual_network_peering.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/virtual_network_peering) | resource |
| [azurerm_virtual_network_peering.this_back](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/virtual_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual network peering from vnet 1 to vnet 2. | `string` | n/a | yes |
| <a name="input_name_back"></a> [name\_back](#input\_name\_back) | The name of the virtual network peering from vnet 2 to vnet 1. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_virtual_network_1_id"></a> [virtual\_network\_1\_id](#input\_virtual\_network\_1\_id) | The ID of virtual network 1 for which we are configuring peering. | `string` | n/a | yes |
| <a name="input_virtual_network_1_name"></a> [virtual\_network\_1\_name](#input\_virtual\_network\_1\_name) | The name of virtual network 1 for which we are configuring peering. | `string` | n/a | yes |
| <a name="input_virtual_network_1_resource_group_name"></a> [virtual\_network\_1\_resource\_group\_name](#input\_virtual\_network\_1\_resource\_group\_name) | The name of the resource group for which we are configuring peering. | `string` | n/a | yes |
| <a name="input_virtual_network_2_id"></a> [virtual\_network\_2\_id](#input\_virtual\_network\_2\_id) | The ID of virtual network 2 for which we are configuring peering. | `string` | n/a | yes |
| <a name="input_virtual_network_2_name"></a> [virtual\_network\_2\_name](#input\_virtual\_network\_2\_name) | The name of virtual network 2 for which we are configuring peering. | `string` | n/a | yes |
| <a name="input_virtual_network_2_resource_group_name"></a> [virtual\_network\_2\_resource\_group\_name](#input\_virtual\_network\_2\_resource\_group\_name) | The name of the resource group for which we are configuring peering. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->