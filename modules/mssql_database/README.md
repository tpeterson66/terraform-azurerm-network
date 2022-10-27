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
| [azurerm_mssql_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/mssql_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_collation"></a> [collation](#input\_collation) | Specifies the collation of the database. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice. | `string` | n/a | yes |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | The max size of the database in gigabytes. | `number` | n/a | yes |
| <a name="input_mssql_db_ltr_monthly"></a> [mssql\_db\_ltr\_monthly](#input\_mssql\_db\_ltr\_monthly) | The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D. | `string` | n/a | yes |
| <a name="input_mssql_db_ltr_week_of_year"></a> [mssql\_db\_ltr\_week\_of\_year](#input\_mssql\_db\_ltr\_week\_of\_year) | The week of year to take the yearly backup. Value has to be between 1 and 52. | `string` | n/a | yes |
| <a name="input_mssql_db_ltr_weekly"></a> [mssql\_db\_ltr\_weekly](#input\_mssql\_db\_ltr\_weekly) | The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D. | `string` | n/a | yes |
| <a name="input_mssql_db_ltr_yearly"></a> [mssql\_db\_ltr\_yearly](#input\_mssql\_db\_ltr\_yearly) | The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D. | `string` | n/a | yes |
| <a name="input_mssql_db_str_days"></a> [mssql\_db\_str\_days](#input\_mssql\_db\_str\_days) | Point In Time Restore configuration. Value has to be between 7 and 35. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | A name of the Microsoft SQL Database. This needs to be globally unique within Azure. | `string` | n/a | yes |
| <a name="input_read_scale"></a> [read\_scale](#input\_read\_scale) | If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases. | `bool` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Specifies the name of the MSSQL Server. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP\_S\_Gen5\_2,HS\_Gen4\_1,BC\_Gen5\_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of the tags to use on the resources that are deployed with this module. | `map(string)` | n/a | yes |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases. | `bool` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | MS SQL Database ID |
| <a name="output_name"></a> [name](#output\_name) | MS SQL Database Name |
<!-- END_TF_DOCS -->