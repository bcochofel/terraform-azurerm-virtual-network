terraform {
  required_version = ">= 0.12.20"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.41.0"
    }
  }
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_network_ddos_protection_plan" "ddospp" {
  count = local.create_ddos_plan ? 1 : 0

  name                = var.ddospp_name
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
  bgp_community         = var.bgp_community
  vm_protection_enabled = var.vm_protection_enabled

  dynamic "ddos_protection_plan" {
    count = local.ddos_plan_id != "" ? ["ddos_protection_plan"] : []
    content {
      id      = local.ddos_plan_id
      enabled = true
    }
  }

  tags = var.tags
}
