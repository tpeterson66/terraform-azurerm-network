provider "azurerm" {
  features {}
}

// resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-test-redis-cache"
  location = "EastUS"
}

// redis cache with default values
module "redis_cache" {
  source              = "../"
  name                = "spacelift-test-redis-cache"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  family              = "C"
  sku_name            = "Basic"
  capacity            = "1"
  zones               = []
}

// redis cache with custom values
module "redis_cache_custom" {
  source              = "../"
  name                = "spacelift-test-redis-cache-custom"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
  family              = "P"
  sku_name            = "Premium"
  capacity            = "1"
  zones               = []
  public_network_access_enabled = true
  minimum_tls_version = 1.2
  redis_configuration = [{
    aof_backup_enabled              = false
    aof_storage_connection_string_0 = "test"
    aof_storage_connection_string_1 = "test"
    enable_authentication           = true
    maxmemory_reserved              = 10
    maxmemory_delta                 = 2
    maxmemory_policy                = "allkeys-lru"
    maxfragmentationmemory_reserved = 200
    rdb_backup_enabled              = true
    rdb_backup_frequency            = 1440
    rdb_backup_max_snapshot_count   = 1
    rdb_storage_connection_string   = "test"
  }]
}