provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-vnet-create-ddospp-example"
  location = "North Europe"
}

module "vnet" {
  source = "../.."

  resource_group_name = azurerm_resource_group.rg.name
  name                = "vnet-create-ddospp-example"
  address_space       = ["10.0.0.0/16"]

  enable_ddos_pp = true
  create_ddos_pp = true
  ddos_pp_name   = "ddospp-example"

  depends_on = [azurerm_resource_group.rg]
}
