output "id" {
  description = "Id of vpn gateway."
  value       = azurerm_virtual_network_gateway.vpn.id
}

output "name" {
  description = "Name of vpn gateway."
  value       = azurerm_virtual_network_gateway.vpn.name
}

output "object" {
  description = "Object of vpn gateway."
  value       = azurerm_virtual_network_gateway.vpn
}