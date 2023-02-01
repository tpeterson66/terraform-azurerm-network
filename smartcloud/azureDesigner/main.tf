# Resource Group
resource "azurerm_resource_group" "tpeterson_rg" {
  name     = "azure-designer"
  location = "East US"
  tags = {
    owner = "Tom Peterson"
    purpose = "Azure Designer"
    budget = "$40"
  }
}

# Azure Designer Site


# Azure Designer site