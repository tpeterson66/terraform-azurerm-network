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
| [azurerm_redis_cache.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.26.0/docs/resources/redis_cache) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_capacity"></a> [capacity](#input\_capacity) | The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4. | `number` | n/a | yes |
| <a name="input_family"></a> [family](#input\_family) | The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium) | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Location where module objects will be deployed | `string` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | The minimum TLS version. Defaults to 1.2. | `number` | `1.2` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of Azure Cache for Redis | `string` | n/a | yes |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. Defaults to true. | `bool` | `true` | no |
| <a name="input_redis_configuration"></a> [redis\_configuration](#input\_redis\_configuration) | Redis configuration | <pre>list(object({<br>      aof_backup_enabled              = bool<br>      aof_storage_connection_string_0 = string<br>      aof_storage_connection_string_1 = string<br>      enable_authentication           = bool<br>      maxmemory_reserved              = number<br>      maxmemory_delta                 = number<br>      maxmemory_policy                = number<br>      maxfragmentationmemory_reserved = number<br>      rdb_backup_enabled              = bool<br>      rdb_backup_frequency            = number<br>      rdb_backup_max_snapshot_count   = number<br>      rdb_storage_connection_string   = string<br>    }))</pre> | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Resource group name for Azure data objects | `string` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | The SKU of Redis to use. Possible values are Basic, Standard and Premium. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | tags to apply to all resources | `map(string)` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Specifies a list of Availability Zones in which this Redis Cache should be located.Feature zones requires a Premium sku to be set. | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_redis_cache"></a> [redis\_cache](#output\_redis\_cache) | ID of Azure Redis Cache. |
<!-- END_TF_DOCS -->