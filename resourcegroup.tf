# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "eastus2"
}

resource "azurerm_resource_group" "example2" {
  name     = "example-resources2"
  location = "westus"
  provider = azurerm.provider2-westus
}

resource "random_string" "myrandom" {
  length  = 16
  special = false
  upper = false
}
