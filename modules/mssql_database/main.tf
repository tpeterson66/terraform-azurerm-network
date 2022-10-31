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
  description = "A name of the Microsoft SQL Database. This needs to be globally unique within Azure."
  type        = string
}
variable "tags" {
  description = "A map of the tags to use on the resources that are deployed with this module."
  type        = map(string)
}
variable "server_id" {
  description = "Specifies the name of the MSSQL Server. Changing this forces a new resource to be created."
  type        = string
}
variable "license_type" {
  description = "Specifies the license type applied to this database. Possible values are LicenseIncluded and BasePrice."
  type        = string
}
variable "collation" {
  description = "Specifies the collation of the database. Changing this forces a new resource to be created."
  type        = string
}
variable "max_size_gb" {
  description = "The max size of the database in gigabytes."
  type        = number
}
variable "read_scale" {
  description = "If enabled, connections that have application intent set to readonly in their connection string may be routed to a readonly secondary replica. This property is only settable for Premium and Business Critical databases."
  type        = bool
}
variable "sku_name" {
  description = "Specifies the name of the sku used by the database. Changing this forces a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  type        = string
}
variable "zone_redundant" {
  description = "Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  type        = bool
}
variable "mssql_db_ltr_weekly" {
  description = "The weekly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 520 weeks. e.g. P1Y, P1M, P1W or P7D."
  type        = string
}
variable "mssql_db_ltr_monthly" {
  description = "The monthly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 120 months. e.g. P1Y, P1M, P4W or P30D."
  type        = string
}
variable "mssql_db_ltr_yearly" {
  description = "The yearly retention policy for an LTR backup in an ISO 8601 format. Valid value is between 1 to 10 years. e.g. P1Y, P12M, P52W or P365D."
  type        = string
}
variable "mssql_db_ltr_week_of_year" {
  description = "The week of year to take the yearly backup. Value has to be between 1 and 52."
  type        = string
}
variable "mssql_db_str_days" {
  description = "Point In Time Restore configuration. Value has to be between 7 and 35."
  type        = string
}

# resources
# mssql database
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server
resource "azurerm_mssql_database" "this" {
  name                = var.name
  server_id           = var.server_id
  sku_name            = var.sku_name
  collation           = var.collation
  license_type        = var.license_type
  max_size_gb         = var.max_size_gb
  read_scale          = var.read_scale
  zone_redundant      = var.zone_redundant
  tags                = var.tags

  long_term_retention_policy {
    weekly_retention  = var.mssql_db_ltr_weekly
    monthly_retention = var.mssql_db_ltr_monthly
    yearly_retention  = var.mssql_db_ltr_yearly
    week_of_year      = var.mssql_db_ltr_week_of_year
  }

  short_term_retention_policy {
    retention_days = var.mssql_db_str_days
  }
}

# outputs
output "id" {
  value       = azurerm_mssql_database.this.id
  description = "MS SQL Database ID"
}
output "name" {
  value       = azurerm_mssql_database.this.name
  description = "MS SQL Database Name"
}