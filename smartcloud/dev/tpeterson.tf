resource "azurerm_resource_group" "tpeterson_rg" {
  name     = "tpeterson-sandbox"
  location = "East US"
  tags = {
    owner = "Tom Peterson"
  }
}

resource "azurerm_role_assignment" "tpeterson_rg_role" {
  scope                = azurerm_resource_group.tpeterson_rg.id
  role_definition_name = "Owner"
  principal_id         = var.users.tpeterson
}