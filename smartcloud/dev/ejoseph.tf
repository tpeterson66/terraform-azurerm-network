resource "azurerm_resource_group" "ejoseph_rg" {
  name     = "ejoseph-sandbox"
  location = "East US"
  tags = {
    owner = "Evan Joseph"
  }
}

resource "azurerm_role_assignment" "ejoseph_rg_role" {
  scope                = azurerm_resource_group.ejoseph_rg.id
  role_definition_name = "Owner"
  principal_id         = var.users.ejoseph
}