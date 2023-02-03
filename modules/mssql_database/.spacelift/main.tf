provider "azurerm" {
  features {}
}

# // mssql database
module "mssql_database" {
  source                    = "../"
  name                      = "spacelift-mssql-database"
  server_id                 = "/subscriptions/d473e918-7273-4745-9214-3f7b999863a3/resourceGroups/spacelift-test-modules/providers/Microsoft.Sql/servers/spacelift-mssql-server"
  license_type              = "LicenseIncluded"
  collation                 = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb               = 1
  read_scale                = false
  sku_name                  = "S0"
  zone_redundant            = false
  mssql_db_ltr_weekly       = null
  mssql_db_ltr_monthly      = null
  mssql_db_ltr_yearly       = "P1M"
  mssql_db_ltr_week_of_year = "1"
  mssql_db_str_days         = "7"

  tags = {
    environment = "module-testing"
    retention   = "DeleteAtWill"
    owner       = "spacelift"
  }
}

