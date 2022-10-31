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
  description = "A name for a Storage account"
  type        = string
}
variable "location" {
  description = "Azure location where Storage account will be deployed"
  type        = string
}
variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
variable "resource_group_name" {
  description = "The name of the resource group in which to create the Storage account."
  type        = string
}
variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid."
  type        = string
}
variable "account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  type        = string
}
variable "is_hns_enabled" {
  description = "Is Hierarchical Namespace enabled? This can be used with Azure Data Lake Storage Gen 2."
  type        = bool
}
variable "public_network_access_enabled" {
  description = "Whether the public network access is enabled? Defaults to true.."
  type        = bool
}
variable "default_action" {
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow."
  type        = string
}
variable "bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None."
  type        = list(string)
}
variable "ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed."
  type        = list(string)
}
variable "virtual_network_subnet_ids" {
  description = "A list of resource ids for subnets."
  type        = list(string)
}

# resources
# storage account
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
resource "azurerm_storage_account" "this" {
  name                          = var.name
  resource_group_name           = var.resource_group_name
  location                      = var.location
  account_tier                  = var.account_tier
  account_replication_type      = var.account_replication_type
  is_hns_enabled                = var.is_hns_enabled
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags
  network_rules {
    default_action             = var.default_action
    bypass                     = var.bypass
    ip_rules                   = var.ip_rules
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }
}

# outputs
output "name" {
  value       = azurerm_storage_account.this.name
  description = "The name of Storage Account"
}
output "primary_blob_endpoint" {
  value       = azurerm_storage_account.this.primary_blob_endpoint
  description = "The primary blob endpoint for Storage Account"
}
output "id" {
  value       = azurerm_storage_account.this.id
  description = "The ID of Storage Account"
}
output "primary_access_key" {
  value       = azurerm_storage_account.this.primary_access_key
  description = "The primary access key of Storage Account"
  sensitive   = true
}
