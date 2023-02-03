# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-private-worker-pool"
  location = "centralus"
  tags = {
    owner = "Tom Peterson"
    purpose = "Spacelift Private Worker Pool for Smartcloud"
    budget = "$40"
  }
}

# virtual network
module "terraform-azurerm-virtual_network" {
  source  = "spacelift.io/coretek/terraform-azurerm-virtual_network/default"
  version = "0.0.1"

  # Required inputs 
  address_space       = ["10.224.0.0/22"]
  location            = azurerm_resource_group.rg.location
  name                = "spacelift-worker-pool"
  resource_group_name = azurerm_resource_group.rg.name
  tags                = azurerm_resource_group.rg.tags
  # Optional inputs 
  # settings = list(object({  dns_servers = list(string)  }))
}

