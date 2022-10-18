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
| [azurerm_lb.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/lb) | resource |
| [azurerm_private_link_service.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/private_link_service) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | (Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic. | `string` | `"Static"` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | Specifies the Name of the Load Balancer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | The supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the Name of the Private link. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_primary"></a> [primary](#input\_primary) | Is this is the Primary IP Configuration? Changing this forces a new resource to be created. | `bool` | n/a | yes |
| <a name="input_public_ip_name"></a> [public\_ip\_name](#input\_public\_ip\_name) | Specifies the Name of the Public IP | `string` | n/a | yes |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | (Optional) The SKU of the Public IP. Accepted values are [Basic] and Standard. | `string` | `"Standard"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Private link should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Private Link Subnet Id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Private Links Service ID |
<!-- END_TF_DOCS -->