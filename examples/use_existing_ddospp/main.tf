provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-vnet-existing-ddospp-example"
  location = "North Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddospp" {
  name                = "ddospp-global"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}

module "vnet" {
  source = "../.."

  resource_group_name = azurerm_resource_group.rg.name
  name                = "vnet-existing-ddospp-example"
  address_space       = ["10.0.0.0/16"]

  enable_ddos_pp              = true
  ddos_pp_name                = azurerm_network_ddos_protection_plan.ddospp.name
  ddos_pp_resource_group_name = azurerm_network_ddos_protection_plan.ddospp.resource_group_name

  depends_on = [azurerm_resource_group.rg, azurerm_network_ddos_protection_plan.ddospp]
}
