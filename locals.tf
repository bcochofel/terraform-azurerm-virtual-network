locals {
  create_ddos_plan = var.ddos_plan_id != "" ? 0 : var.enable_ddos_plan && var.ddos_plan_name != "" ? 1 : 0
  ddos_plan_id     = var.ddos_plan_id != "" ? var.ddos_plan_id : var.enable_ddos_plan && var.ddos_plan_name != "" ? azurerm_network_ddos_protection_plan.ddospp[0].id : ""
}
