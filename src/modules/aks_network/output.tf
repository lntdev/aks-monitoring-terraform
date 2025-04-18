# output "aks_subnet_id" {
#   value = azurerm_virtual_network.aks_vnet.subnet
# }
output "aks_vnet_id" {
  value = azurerm_virtual_network.aks_vnet.id
}

# output "aks_security_id" {
#   value = azurerm_network_security_group.securitygp.id
# }

output "aks_subnet_id" {
  value = azurerm_subnet.aks_subnet.id
}


# output "aks_subnet" {
#   value = azurerm_virtual_network.aks_vnet.subnet
# }
