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
| [azurerm_monitor_metric_alert.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_group_id"></a> [action\_group\_id](#input\_action\_group\_id) | Specifies the ID of the Action group | `string` | n/a | yes |
| <a name="input_enable_metric_alerts"></a> [enable\_metric\_alerts](#input\_enable\_metric\_alerts) | Do you want to enable monitor metric alert for this resource? | `bool` | n/a | yes |
| <a name="input_metric_alerts"></a> [metric\_alerts](#input\_metric\_alerts) | Monitor Metric alert variables to be passed | <pre>list(object({<br>      name               = string<br>      metric_namespace   = string<br>      metric_name        = string<br>      aggregation        = string<br>      operator           = string<br>      threshold          = string<br>      dimension_name     = string<br>      dimension_operator = string<br>      dimension_values   = list(string)<br>    }))</pre> | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Monitor Metric Alert. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the metric alert. |
<!-- END_TF_DOCS -->