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
| [azurerm_lb_backend_address_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_probe.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/lb_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Allocation method for IP configuration. (Options: 1. [Static] 2. Dynamic). | `string` | n/a | yes |
| <a name="input_backend_pool_name"></a> [backend\_pool\_name](#input\_backend\_pool\_name) | Load balancer backend pool name | `string` | n/a | yes |
| <a name="input_frontend_ip_configuration_name"></a> [frontend\_ip\_configuration\_name](#input\_frontend\_ip\_configuration\_name) | Specifies the name of the public IP. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the Load Balancer should exist. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Load Balancer. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group in which the Load Balancershould exist. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the Azure Load Balancer. Accepted values are Basic, Standard and Gateway. Defaults to Basic. | `string` | `"Standard"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Associated subnet ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lb_backend_address_pool_id"></a> [lb\_backend\_address\_pool\_id](#output\_lb\_backend\_address\_pool\_id) | Load Balancer Backend Address Pool ID |
| <a name="output_lb_backend_address_pool_name"></a> [lb\_backend\_address\_pool\_name](#output\_lb\_backend\_address\_pool\_name) | Load Balancer Backend Address Pool Name |
| <a name="output_lb_id"></a> [lb\_id](#output\_lb\_id) | Load Balancer ID |
| <a name="output_lb_name"></a> [lb\_name](#output\_lb\_name) | Load Balancer Name |
| <a name="output_lb_prob_id"></a> [lb\_prob\_id](#output\_lb\_prob\_id) | Health Probe ID |
| <a name="output_lb_prob_name"></a> [lb\_prob\_name](#output\_lb\_prob\_name) | Health Probe Name |
<!-- END_TF_DOCS -->