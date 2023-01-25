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
| [azurerm_private_endpoint.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/private_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_is_manual_connection"></a> [is\_manual\_connection](#input\_is\_manual\_connection) | Does the Private Endpoint require Manual Approval from the remote resource owner? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the Name of the Private Endpoint. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_connection_resource_id"></a> [private\_connection\_resource\_id](#input\_private\_connection\_resource\_id) | The ID of the Private Link Enabled Remote Resource which this Private Endpoint should be connected to. One of private\_connection\_resource\_id or private\_connection\_resource\_alias must be specified. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_dns_zone_group_name"></a> [private\_dns\_zone\_group\_name](#input\_private\_dns\_zone\_group\_name) | Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_dns_zone_ids"></a> [private\_dns\_zone\_ids](#input\_private\_dns\_zone\_ids) | Specifies the list of Private DNS Zones to include within the private\_dns\_zone\_group. | `list(string)` | n/a | yes |
| <a name="input_private_service_connection_name"></a> [private\_service\_connection\_name](#input\_private\_service\_connection\_name) | Specifies the Name of the Private Service Connection. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Private Endpoint should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of the Subnet from which Private IP Addresses will be allocated for this Private Endpoint. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Private Endpoint. |
| <a name="output_name"></a> [name](#output\_name) | The name of the Private Endpoint. |
| <a name="output_private_dns_zone_group"></a> [private\_dns\_zone\_group](#output\_private\_dns\_zone\_group) | Private DNS Zone group details. |
<!-- END_TF_DOCS -->