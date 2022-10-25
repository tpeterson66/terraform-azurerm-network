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
| [azurerm_application_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/application_gateway) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/public_ip) | resource |
| [azurerm_user_assigned_identity.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/user_assigned_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Allocation method of public IP. Accepted values are Dynamic and Static. Public IP Standard SKUs require allocation\_method to be set to Static. | `string` | n/a | yes |
| <a name="input_application_gateway_capacity"></a> [application\_gateway\_capacity](#input\_application\_gateway\_capacity) | The Capacity of the SKU to use for this Application Gateway. When using a V1 SKU this value must be between 1 and 32, and 1 to 125 for a V2 SKU. This property is optional if autoscale\_configuration is set. | `string` | n/a | yes |
| <a name="input_application_gateway_sku"></a> [application\_gateway\_sku](#input\_application\_gateway\_sku) | The Name of the SKU to use for this Application Gateway. Possible values are Standard\_Small, Standard\_Medium, Standard\_Large, Standard\_v2, WAF\_Medium, WAF\_Large, and WAF\_v2. | `string` | n/a | yes |
| <a name="input_application_gateway_tier"></a> [application\_gateway\_tier](#input\_application\_gateway\_tier) | The Tier of the SKU to use for this Application Gateway. Possible values are Standard, Standard\_v2, WAF and WAF\_v2.. | `string` | n/a | yes |
| <a name="input_create_identity"></a> [create\_identity](#input\_create\_identity) | If user assigned identity should be created. true or false. | `bool` | n/a | yes |
| <a name="input_gateway_ip_configuration_subnet_id"></a> [gateway\_ip\_configuration\_subnet\_id](#input\_gateway\_ip\_configuration\_subnet\_id) | The ID of the Subnet which the Application Gateway should be connected to. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region where the Application Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the Application Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_ip_address"></a> [private\_ip\_address](#input\_private\_ip\_address) | The Private IP Address to use for the Application Gateway. | `string` | n/a | yes |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | The allocation method used for the Private IP Address. Possible values are Dynamic and Static. | `string` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Name of the public IP address used by the Application Gateway | `string` | n/a | yes |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to the Application Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_rule_type"></a> [rule\_type](#input\_rule\_type) | The Type of Routing that should be used for this Rule. Possible values are [Basic] and PathBasedRouting. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#input\_user\_assigned\_identity\_id) | Specifies only one User Assigned Managed Identity ID to be assigned to this Application Gateway. Only applicable if create\_identity is false. | `list(string)` | n/a | yes |
| <a name="input_user_assigned_identity_name"></a> [user\_assigned\_identity\_name](#input\_user\_assigned\_identity\_name) | The name of the user assigned identity. Changing this forces a new identity to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Application Gateway ID |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | Private IP address for Application Gateway |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | Public IP address for Application Gateway |
| <a name="output_user_assigned_identity_id"></a> [user\_assigned\_identity\_id](#output\_user\_assigned\_identity\_id) | Principal ID of User Assigned Identity for Application Gateway |
<!-- END_TF_DOCS -->