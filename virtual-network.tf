resource "azurerm_virtual_network" "terraform-net" {
  name                = "terraform-net"
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "terraform-subnet" {
  name                 = "terraform-subnet"
  resource_group_name  = azurerm_resource_group.terraform-rg.name
  virtual_network_name = azurerm_virtual_network.terraform-net.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "terraform-publicip" {
  name                = "terraform-publicip"
  resource_group_name = azurerm_resource_group.terraform-rg.name
  location            = azurerm_resource_group.terraform-rg.location
  allocation_method   = "Static"

  tags = {
    environment = "terraform"
  }
}

resource "azurerm_network_interface" "terraform-nic" {
  name                = "terraform-nic"
  location            = azurerm_resource_group.terraform-rg.location
  resource_group_name = azurerm_resource_group.terraform-rg.name

  ip_configuration {
    name                          = "terraform-ip"
    subnet_id                     = azurerm_subnet.terraform-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.terraform-publicip.id
  }
}