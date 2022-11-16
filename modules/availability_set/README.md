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
| [azurerm_availability_set.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/availability_set) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the Name of the Availability set. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_platform_fault_domain_count"></a> [platform\_fault\_domain\_count](#input\_platform\_fault\_domain\_count) | Specifies the number of fault domains that are used. Defaults to 3.The number of Fault Domains varies depending on which Azure Region you're using - a list can be found here:https://github.com/MicrosoftDocs/azure-docs/blob/main/includes/managed-disks-common-fault-domain-region-list.md | `number` | n/a | yes |
| <a name="input_platform_update_domain_count"></a> [platform\_update\_domain\_count](#input\_platform\_update\_domain\_count) | Specifies the number of update domains that are used. Defaults to 5. | `number` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Specifies the Name of the Resource Group within which the Availability set should exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Azure Availability set ID |
| <a name="output_name"></a> [name](#output\_name) | Azure Availability set Name |
<!-- END_TF_DOCS -->