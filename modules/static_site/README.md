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
| [azurerm_static_site.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/static_site) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_identity_type"></a> [identity\_type](#input\_identity\_type) | The Type of Managed Identity assigned to this Static Site resource. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where Static Site will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for a Static Site | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Static Site. | `string` | n/a | yes |
| <a name="input_sku_size"></a> [sku\_size](#input\_sku\_size) | Specifies the SKU size of the Static Web App. Possible values are Free or Standard. Defaults to Free. | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | Specifies the SKU tier of the Static Web App. Possible values are Free or Standard. Defaults to Free. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_user_assigned_identities"></a> [user\_assigned\_identities](#input\_user\_assigned\_identities) | Specifies User Assigned Managed Identity IDs to be assigned to this static site. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_host_name"></a> [default\_host\_name](#output\_default\_host\_name) | The Default Hostname associated with the Static Site. |
| <a name="output_id"></a> [id](#output\_id) | The ID of the Static Site. |
<!-- END_TF_DOCS -->