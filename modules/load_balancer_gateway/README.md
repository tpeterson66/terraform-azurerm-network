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
| <a name="input_frontend_ip_configuration_name"></a> [frontend\_ip\_configuration\_name](#input\_frontend\_ip\_configuration\_name) | Specifies the name of the public IP. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the Load Balancer should exist. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Load Balancer. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group in which the Load Balancershould exist. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Subnet ID for Load Balancer frontend ip configuration | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_frontend_ip_configuration"></a> [frontend\_ip\_configuration](#output\_frontend\_ip\_configuration) | A `frontend_ip_configuration` block |
| <a name="output_id"></a> [id](#output\_id) | The Load Balancer ID. |
| <a name="output_lb_backend_address_pool_id"></a> [lb\_backend\_address\_pool\_id](#output\_lb\_backend\_address\_pool\_id) | The Load Balancer Backend Address Pool ID. |
| <a name="output_lb_probe_id"></a> [lb\_probe\_id](#output\_lb\_probe\_id) | The Load Balancer Probe ID. |
| <a name="output_lb_rule_id"></a> [lb\_rule\_id](#output\_lb\_rule\_id) | The Load Balancer Rule ID. |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The first private IP address assigned to the load balancer in `frontend_ip_configuration` blocks, if any. |
<!-- END_TF_DOCS -->