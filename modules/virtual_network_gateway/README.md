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
| [azurerm_virtual_network_gateway.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/virtual_network_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance SKU. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space out of which IP addresses for vpn clients will be taken. You can provide more than one address space, e.g. in CIDR notation. | `list(string)` | n/a | yes |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | Specifies the name of the IP configuration. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Specifies the supported Azure location where the Virtual Network Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the name of the Virtual Network Gateway. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_private_ip_address_allocation_method"></a> [private\_ip\_address\_allocation\_method](#input\_private\_ip\_address\_allocation\_method) | Defines how the private IP address of the gateways virtual interface is assigned. Valid options are Static or [Dynamic]. | `string` | `"Dynamic"` | no |
| <a name="input_public_ip_address_id"></a> [public\_ip\_address\_id](#input\_public\_ip\_address\_id) | Specifies the ID of public IP to be used. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the name of the Resource Group in which the Virtual Network Gateway should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Configuration of the size and capacity of the virtual network gateway. Valid options are Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4,VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ,VpnGw4AZ and VpnGw5AZ and depend on the type, vpn\_type and generation arguments. | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | Specifies the ID of subnet to be used. Expecting to reference a gateway subnet with name GatewaySubnet | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | The type of the Virtual Network Gateway. Valid options are Vpn or ExpressRoute. | `string` | n/a | yes |
| <a name="input_vpn_type"></a> [vpn\_type](#input\_vpn\_type) | The routing type of the Virtual Network Gateway. Valid options are [RouteBased] or PolicyBased. | `string` | `"RouteBased"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Virtual Network Gateway ID |
<!-- END_TF_DOCS -->