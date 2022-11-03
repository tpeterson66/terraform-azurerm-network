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
| <a name="module_monitor_action_group"></a> [monitor\_action\_group](#module\_monitor\_action\_group) | ../monitor_action_group | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_metric_alert.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/monitor_metric_alert) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aggregation"></a> [aggregation](#input\_aggregation) | The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. | `string` | n/a | yes |
| <a name="input_dimension_name"></a> [dimension\_name](#input\_dimension\_name) | One of the dimension names. | `string` | n/a | yes |
| <a name="input_dimension_operator"></a> [dimension\_operator](#input\_dimension\_operator) | The dimension operator. Possible values are Include, Exclude and StartsWith. | `string` | n/a | yes |
| <a name="input_dimension_values"></a> [dimension\_values](#input\_dimension\_values) | The list of dimension values. | `list(string)` | n/a | yes |
| <a name="input_metric_name"></a> [metric\_name](#input\_metric\_name) | One of the metric names to be monitored. | `string` | n/a | yes |
| <a name="input_metric_namespace"></a> [metric\_namespace](#input\_metric\_namespace) | One of the metric namespaces to be monitored. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for a Monitor Metric Alert. | `string` | n/a | yes |
| <a name="input_operator"></a> [operator](#input\_operator) | The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Monitor Metric Alert. | `string` | n/a | yes |
| <a name="input_scopes"></a> [scopes](#input\_scopes) | A set of strings of resource IDs at which the metric criteria should be applied. | `list(string)` | n/a | yes |
| <a name="input_short_name"></a> [short\_name](#input\_short\_name) | Specifies the name of the Action group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_threshold"></a> [threshold](#input\_threshold) | The criteria threshold value that activates the alert. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the metric alert. |
<!-- END_TF_DOCS -->