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
| [azurerm_route_table.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/route_table) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disable_bgp_route_propagation"></a> [disable\_bgp\_route\_propagation](#input\_disable\_bgp\_route\_propagation) | Boolean flag which controls propagation of routes learned by BGP on that route table. True means disable. | `bool` | `false` | no |
| <a name="input_location"></a> [location](#input\_location) | Azure location where route table will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for route table | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the route table. | `string` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | Routes to be added to the route table | <pre>list(object({<br>    name           = string # The name for the route<br>    address_prefix = string # The destination to which the route applies. Can be CIDR (such as 10.1.0.0/16) or Azure Service Tag (such as ApiManagement, AzureBackup or AzureMonitor) format.<br>    next_hop_type  = string # The type of Azure hop the packet should be sent to. Possible values are VirtualNetworkGateway, VnetLocal, Internet, VirtualAppliance and None.<br>    next_hop_in_ip_address = string # Contains the IP address packets should be forwarded to. Next hop values are only allowed in routes where the next hop type is VirtualAppliance.<br>  }))</pre> | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Azure route table ID post creation |
| <a name="output_name"></a> [name](#output\_name) | Azure route table name post creation |
<!-- END_TF_DOCS -->