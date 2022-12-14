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
| [azurerm_portal_dashboard.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/portal_dashboard) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | Dashboards definitions | <pre>list(<br>    object({<br>      name      = string<br>      tpl_file  = string<br>      variables = map(string)<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure Region where the Portal Dashboard will be deployed | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The Azure Resource Group Name for management | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ids"></a> [ids](#output\_ids) | The IDs of Azure Portal Dashboards. |
<!-- END_TF_DOCS -->