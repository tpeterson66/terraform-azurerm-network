# Resource group
resource "azurerm_resource_group" "rg" {
  name     = "spacelift-private-worker-pool"
  location = "eastus"
  tags = {
    owner = "Tom Peterson"
    purpose = "Spacelift Private Worker Pool for Smartcloud"
    budget = "$60"
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

resource "azurerm_subnet" "worker_pool" {
  name                 = "WorkerPool"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = module.terraform-azurerm-virtual_network.name
  address_prefixes     = ["10.224.0.0/24"]
}

resource "azurerm_network_interface" "nic" {
  name                = "vm-spaceliftworkerpool"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = azurerm_resource_group.rg.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.worker_pool.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "worker_pool" {
  name                = "spaceliftworkerpool"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  tags                = azurerm_resource_group.rg.tags
  size                = "Standard_D2s_v3"
  admin_username      = "coretekadmin"
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = "coretekadmin"
    public_key = file("/mnt/workspace/spaceliftworkerpool.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "worker_pool" {
  name                = "vm-spaceliftworkerpool"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
  tags                = azurerm_resource_group.rg.tags
}

resource "azurerm_network_security_group" "worker_pool" {
  name                = "vm-spaceliftworkerpool"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = azurerm_resource_group.rg.tags

  security_rule {
    name                       = "tpeterson_home"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "162.197.55.204/32"
    destination_address_prefix = "*"
  }
}

resource "azurerm_subnet_network_security_group_association" "worker_pool" {
  subnet_id                 = azurerm_subnet.worker_pool.id
  network_security_group_id = azurerm_network_security_group.worker_pool.id
}