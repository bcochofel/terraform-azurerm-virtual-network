data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

data "azurerm_network_ddos_protection_plan" "ddospp" {
  count = var.enable_ddos_pp && !var.create_ddos_pp ? 1 : 0

  name                = var.ddos_pp_name
  resource_group_name = var.ddos_pp_resource_group_name
}

resource "azurerm_network_ddos_protection_plan" "ddospp" {
  count = var.create_ddos_pp && var.enable_ddos_pp ? 1 : 0

  name                = var.ddos_pp_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location

  tags = var.tags
}

resource "azurerm_virtual_network" "vnet" {
  name                  = var.name
  resource_group_name   = data.azurerm_resource_group.rg.name
  location              = data.azurerm_resource_group.rg.location
  address_space         = var.address_space
  dns_servers           = var.dns_servers
  vm_protection_enabled = var.vm_protection_enabled

  dynamic "ddos_protection_plan" {
    for_each = local.ddos_pp_id != "" ? ["ddos_protection_plan"] : []
    content {
      id     = local.ddos_pp_id
      enable = true
    }
  }

  tags = var.tags
}
