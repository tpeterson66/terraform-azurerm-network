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
| [azurerm_application_insights_workbook.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/application_insights_workbook) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_json"></a> [data\_json](#input\_data\_json) | Path to workbook data json file | `string` | n/a | yes |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | Specifies the user-defined name (display name) of the workbook. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Application Insights Workbook will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Specifies the Name of the Application Insights Workbook. Specifies the name of this Workbook as a UUID/GUID. It should not contain any uppercase letters. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Azure Resource Group Name for management | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the Application Insights Workbook. |
<!-- END_TF_DOCS -->