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
| [azurerm_windows_web_app.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/windows_web_app) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_command_line"></a> [app\_command\_line](#input\_app\_command\_line) | The App command line to launch. | `string` | n/a | yes |
| <a name="input_app_settings"></a> [app\_settings](#input\_app\_settings) | A map of key-value pairs of App Settings. | `map(string)` | `{}` | no |
| <a name="input_connection_strings"></a> [connection\_strings](#input\_connection\_strings) | Optional Connection Strings | <pre>list(object({<br>    name  = string<br>    type  = string<br>    value = string<br>  }))</pre> | `[]` | no |
| <a name="input_firewall_ip"></a> [firewall\_ip](#input\_firewall\_ip) | Firewall IP | `string` | n/a | yes |
| <a name="input_header_frontdoor_id"></a> [header\_frontdoor\_id](#input\_header\_frontdoor\_id) | Front door header | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where Windows App Service will be deployed | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name for Windows App Service | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the Windows App Service. | `string` | n/a | yes |
| <a name="input_service_plan_id"></a> [service\_plan\_id](#input\_service\_plan\_id) | The id of App Service Plan to be used. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_default_hostname"></a> [default\_hostname](#output\_default\_hostname) | Default Site Hostname for Windows Web App |
| <a name="output_id"></a> [id](#output\_id) | Windows Web App ID |
| <a name="output_name"></a> [name](#output\_name) | Windows Web App Name |
<!-- END_TF_DOCS -->