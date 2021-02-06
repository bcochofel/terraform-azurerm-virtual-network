provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "rg-vnet-basic-example"
  location = "North Europe"
}

module "vnet" {
  source = "../.."

  resource_group_name = azurerm_resource_group.example.name
  name                = "vnet-basic-example"
  address_space       = ["10.0.0.0/16"]
}
