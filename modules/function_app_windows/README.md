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
| [azurerm_windows_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/windows_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_elastic_instance_minimum"></a> [elastic\_instance\_minimum](#input\_elastic\_instance\_minimum) | The number of minimum instances for this function app. Only affects apps on the Premium plan. | `number` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where Windows Function App will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for Windows Function App. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Windows Function App. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The id of App Service Plan to be used. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The access key which will be used to access the backend storage account for the Function App. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The backend storage account name which will be used by this Function App (such as the dashboard, logs). | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of Windows Function App |
| <a name="output_name"></a> [name](#output\_name) | ID of Windows Function App |
<!-- END_TF_DOCS -->