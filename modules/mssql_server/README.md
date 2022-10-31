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
| [azurerm_mssql_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/mssql_server) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | The administrator login name for the new server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_administrator_login_password"></a> [administrator\_login\_password](#input\_administrator\_login\_password) | The password associated with the administrator\_login user. Needs to comply with Azure's Password Policy | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Azure location where SQL Server will be deployed | `string` | n/a | yes |
| <a name="input_mssql_server_version"></a> [mssql\_server\_version](#input\_mssql\_server\_version) | The version for the new server. Valid values are: 2.0 (for v11 server) and [12.0] (for v12 server). | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name of the Microsoft SQL Server. This needs to be globally unique within Azure. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which to create the SQL Server. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | SQL Server ID |
| <a name="output_name"></a> [name](#output\_name) | SQL Server Name |
<!-- END_TF_DOCS -->