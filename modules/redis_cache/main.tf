terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}
provider "azurerm"  {
  features {}
}

# variables
variable "name" {
  description = "Name of Azure Cache for Redis"
  type        = string
}
variable "resource_group_name" {
  description = "Resource group name for Azure data objects"
  type        = string
}
variable "location" {
  description = "Location where module objects will be deployed"
  type        = string
}
variable "tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = null
}
variable "family" {
  description = " The SKU family/pricing group to use. Valid values are C (for Basic/Standard SKU family) and P (for Premium)"
  type        = string
}
variable "sku_name" {
  description = "The SKU of Redis to use. Possible values are Basic, Standard and Premium."
  type        = string
}
variable "capacity" {
  description = "The size of the Redis cache to deploy. Valid values for a SKU family of C (Basic/Standard) are 0, 1, 2, 3, 4, 5, 6, and for P (Premium) family are 1, 2, 3, 4."
  type        = number
}
variable "zones" {
  description = " Specifies a list of Availability Zones in which this Redis Cache should be located.Feature zones requires a Premium sku to be set."
  type        = list(string)
}
variable "minimum_tls_version" {
  description = "The minimum TLS version. Defaults to 1.2."
  type        = number
  default     = 1.2
}
variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this Redis Cache. true means this resource could be accessed by both public and private endpoint. false means only private endpoint access is allowed. Defaults to true."
  type        = bool
  default     = true
}
variable "redis_configuration"{
  description = "Redis configuration"
    type        = list(object({
      aof_backup_enabled              = bool
      aof_storage_connection_string_0 = string
      aof_storage_connection_string_1 = string
      enable_authentication           = bool
      maxmemory_reserved              = number
      maxmemory_delta                 = number
      maxmemory_policy                = number
      maxfragmentationmemory_reserved = number
      rdb_backup_enabled              = bool
      rdb_backup_frequency            = number
      rdb_backup_max_snapshot_count   = number
      rdb_storage_connection_string   = string
    }))
   default = []
}

# resources
# redis cache
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/redis_cache
resource "azurerm_redis_cache" "this" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  capacity                      = var.capacity
  family                        = var.family
  sku_name                      = var.sku_name
  minimum_tls_version           = var.minimum_tls_version
  public_network_access_enabled = var.public_network_access_enabled
  zones                         = var.sku_name == "Premium" ? var.zones : null
  tags                          = var.tags
  
  
  dynamic "redis_configuration" {
    for_each = var.redis_configuration

    content {
      aof_backup_enabled              = try(redis_configuration.value["aof_backup_enabled"], null)
      aof_storage_connection_string_0 = try(redis_configuration.value["aof_storage_connection_string_0"], null)
      aof_storage_connection_string_1 = try(redis_configuration.value["aof_storage_connection_string_1"], null)
      enable_authentication           = try(redis_configuration.value["enable_authentication"], null)
      maxmemory_reserved              = try(redis_configuration.value["maxmemory_reserved"], null)
      maxmemory_delta                 = try(redis_configuration.value["maxmemory_delta"], null)
      maxmemory_policy                = try(redis_configuration.value["maxmemory_policy"], null)
      maxfragmentationmemory_reserved = try(redis_configuration.value["maxfragmentationmemory_reserved"], null)
      rdb_backup_enabled              = try(redis_configuration.value["rdb_backup_enabled"], null)
      rdb_backup_frequency            = try(redis_configuration.value["rdb_backup_frequency"], null)
      rdb_backup_max_snapshot_count   = try(redis_configuration.value["rdb_backup_max_snapshot_count"], null)
      rdb_storage_connection_string   = try(redis_configuration.value["rdb_storage_connection_string"], null)
    }
  }
}

# outputs
output "id" {
  value = azurerm_redis_cache.this.id
  description = "ID of Azure Redis Cache."
}
output "name" {
  value = azurerm_redis_cache.this.name
  description = "ID of Azure Redis Cache."
}