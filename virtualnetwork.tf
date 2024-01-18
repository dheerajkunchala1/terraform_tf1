#Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  tags = {"environment":"staging2"}
}


#Create Sub Net
resource "azurerm_subnet" "mysubnet" {
  name                 = "mysubnet-1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

#Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
  name                    = "mypublicip-1"
  location                = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
  allocation_method       = "Static"
  idle_timeout_in_minutes = 30

  tags = {"environment":"staging2"}

}

#Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
  name = "vmnic-1"
  location = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }
}