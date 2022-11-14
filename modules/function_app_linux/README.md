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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_monitor_diagnostic_setting"></a> [monitor\_diagnostic\_setting](#module\_monitor\_diagnostic\_setting) | ../monitor_diagnostic_settings | n/a |
| <a name="module_monitor_metric_alerts"></a> [monitor\_metric\_alerts](#module\_monitor\_metric\_alerts) | ../monitor_metric_alert | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_function_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/linux_function_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_id"></a> [action\_group\_id](#input\_action\_group\_id) | The ID of action group to be used in monitoring alerts. | `string` | n/a | yes |
| <a name="input_elastic_instance_minimum"></a> [elastic\_instance\_minimum](#input\_elastic\_instance\_minimum) | The number of minimum instances for this function app. Only affects apps on the Premium plan. | `number` | n/a | yes |
| <a name="input_enable_diagnostics"></a> [enable\_diagnostics](#input\_enable\_diagnostics) | Do you want to enable monitor diagnostic setting for this resource? | `bool` | n/a | yes |
| <a name="input_enable_metric_alerts"></a> [enable\_metric\_alerts](#input\_enable\_metric\_alerts) | Do you want to enable monitor metric alert for this resource? | `bool` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where Linux Function App will be deployed | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The name of the resource group in which to create the Storage account. | `string` | n/a | yes |
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | Monitor Metric alert variables to be passed | <pre>list(object({<br>      name               = string<br>      metric_namespace   = string<br>      metric_name        = string<br>      aggregation        = string<br>      operator           = string<br>      threshold          = string<br>      dimension_name     = string<br>      dimension_operator = string<br>      dimension_values   = list(string)<br>    }))</pre> | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for Linux Function App. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Linux Function App. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The id of App Service Plan to be used. | `string` | n/a | yes |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | The access key which will be used to access the backend storage account for the Function App. | `string` | n/a | yes |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | The backend storage account name which will be used by this Function App (such as the dashboard, logs). | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of Linux Function App |
| <a name="output_name"></a> [name](#output\_name) | ID of Linux Function App |
<!-- END_TF_DOCS -->