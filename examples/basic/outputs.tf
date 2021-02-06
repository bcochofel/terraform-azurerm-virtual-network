output "id" {
  value = module.vnet.id
}

output "name" {
  value = module.vnet.name
}

output "resource_group_name" {
  value = module.vnet.resource_group_name
}

output "location" {
  value = module.vnet.location
}

output "address_space" {
  value = module.vnet.address_space
}

output "ddospp_id" {
  value = module.vnet.ddospp_id
}

output "ddospp_virtual_network_ids" {
  value = module.vnet.ddospp_virtual_network_ids
}
