provider "azurerm" {
  features {}
}

module "rg" {
  source  = "bcochofel/resource-group/azurerm"
  version = "1.2.0"

  name     = "rg-vnet-existing-ddospp-example"
  location = "North Europe"
}

resource "azurerm_network_ddos_protection_plan" "ddospp" {
  name                = "ddospp-global"
  resource_group_name = module.rg.name
  location            = module.rg.location
}

module "vnet" {
  source = "../.."

  resource_group_name = module.rg.name
  name                = "vnet-existing-ddospp-example"
  address_space       = ["10.0.0.0/16"]

  enable_ddos_pp              = true
  ddos_pp_name                = azurerm_network_ddos_protection_plan.ddospp.name
  ddos_pp_resource_group_name = azurerm_network_ddos_protection_plan.ddospp.resource_group_name

  depends_on = [module.rg, azurerm_network_ddos_protection_plan.ddospp]
}
