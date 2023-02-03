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
