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
| [azurerm_subnet.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_prefixes"></a> [address\_prefixes](#input\_address\_prefixes) | The subnet address prefix | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the subnet | `string` | n/a | yes |
| <a name="input_private_endpoint_network_policies_enabled"></a> [private\_endpoint\_network\_policies\_enabled](#input\_private\_endpoint\_network\_policies\_enabled) | Enforce private endpoint network policies. Defaults to true | `bool` | n/a | yes |
| <a name="input_private_link_service_network_policies_enabled"></a> [private\_link\_service\_network\_policies\_enabled](#input\_private\_link\_service\_network\_policies\_enabled) | Enforce network policies. Defaults to true. | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group for the resource | `string` | n/a | yes |
| <a name="input_service_endpoints"></a> [service\_endpoints](#input\_service\_endpoints) | List of service endpoints.Possible values include: Microsoft.AzureActiveDirectory, Microsoft.AzureCosmosDB, Microsoft.ContainerRegistry, Microsoft.EventHub, Microsoft.KeyVault, Microsoft.ServiceBus, Microsoft.Sql, Microsoft.Storage and Microsoft.Web. | `list(string)` | n/a | yes |
| <a name="input_settings"></a> [settings](#input\_settings) | n/a | `map` | <pre>{<br>  "delegation": {<br>    "actions": [<br>      "Microsoft.Network/virtualNetworks/subnets/join/action",<br>      "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action"<br>    ],<br>    "name": "delegation",<br>    "service_delegation": "Microsoft.ContainerInstance/containerGroups"<br>  }<br>}</pre> | no |
| <a name="input_virtual_network_name"></a> [virtual\_network\_name](#input\_virtual\_network\_name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->