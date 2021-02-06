locals {
  ddos_pp_id = var.enable_ddos_pp && var.create_ddos_pp ? azurerm_network_ddos_protection_plan.ddospp[0].id : var.enable_ddos_pp && !var.create_ddos_pp ? data.azurerm_network_ddos_protection_plan.ddospp[0].id : ""
}
