output "id" {
  description = "The virtual network ID."
  value       = azurerm_virtual_network.vnet.id
}

output "name" {
  description = "The name of the virtual network."
  value       = azurerm_virtual_network.vnet.name
}

output "resource_group_name" {
  description = "The name of the resource group in which to create the virtual network."
  value       = azurerm_virtual_network.vnet.resource_group_name
}

output "location" {
  description = "The location/region where the virtual network is created."
  value       = azurerm_virtual_network.vnet.location
}

output "address_space" {
  description = "The list of address spaces used by the virtual network."
  value       = azurerm_virtual_network.vnet.address_space
}

output "ddospp_id" {
  description = "The ID of the DDoS Protection Plan."
  value       = local.ddos_pp_id
}

output "ddospp_virtual_network_ids" {
  description = "A list of Virtual Network ID's associated with the DDoS Protection Plan."
  value       = var.enable_ddos_pp && var.create_ddos_pp ? azurerm_network_ddos_protection_plan.ddospp[0].virtual_network_ids : var.enable_ddos_pp && !var.create_ddos_pp ? data.azurerm_network_ddos_protection_plan.ddospp[0].virtual_network_ids : []
}
