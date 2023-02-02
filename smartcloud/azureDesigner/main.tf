# Resource Group
resource "azurerm_resource_group" "azure_designer" {
  name     = "azure-designer"
  location = "centralus"
  tags = {
    owner = "Tom Peterson"
    purpose = "Azure Designer"
    budget = "$40"
  }
}

# Azure Designer Site
module "terraform-azurerm-static_site" {
  source  = "spacelift.io/coretek/terraform-azurerm-static_site/default"
  version = "0.0.1"

  # Required inputs 
  location            = azurerm_resource_group.azure_designer.location
  name                = "azure-designer-caf"
  resource_group_name = azurerm_resource_group.azure_designer.name
  sku_size            = "Standard"
  sku_tier            = "Standard"
  tags                = azurerm_resource_group.azure_designer.tags
}

# Azure Designer site