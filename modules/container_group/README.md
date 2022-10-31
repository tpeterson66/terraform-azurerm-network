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
| [azurerm_container_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/container_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_cpu"></a> [container\_cpu](#input\_container\_cpu) | The required number of CPU cores of the containers. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_container_image"></a> [container\_image](#input\_container\_image) | The container image name. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_container_memory"></a> [container\_memory](#input\_container\_memory) | The required memory of the containers in GB. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_container_name"></a> [container\_name](#input\_container\_name) | Specifies the name of the Container. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_container_port"></a> [container\_port](#input\_container\_port) | The port number the container will expose. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_container_protocol"></a> [container\_protocol](#input\_container\_protocol) | The network protocol associated with port. Possible values are TCP & UDP. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | Specifies the IP address type of the container. Public, Private or None. Changing this forces a new resource to be created. If set to Private, network\_profile\_id also needs to be set. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where Container group will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for a Container group | `string` | n/a | yes |
| <a name="input_network_profile_id"></a> [network\_profile\_id](#input\_network\_profile\_id) | Network profile ID for deploying to virtual network. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The OS for the container group. Allowed values are Linux and Windows. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Container group. | `string` | n/a | yes |
| <a name="input_restart_policy"></a> [restart\_policy](#input\_restart\_policy) | Restart policy for the container group. Allowed values are Always, Never, OnFailure. Defaults to Always. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_group_id"></a> [group\_id](#output\_group\_id) | ID of the Container Group. |
| <a name="output_group_name"></a> [group\_name](#output\_group\_name) | Name of the Container Group |
<!-- END_TF_DOCS -->