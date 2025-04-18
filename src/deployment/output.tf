output "aks_id" {
  value = module.aks_cluster.azurerm_kubernetes_cluster_id
}

output "aks_fqdn" {
  value = module.aks_cluster.azurerm_kubernetes_cluster_fqdn
}

output "aks_node_rg" {
  value = module.aks_cluster.azurerm_kubernetes_cluster_node_resource_group
  
}

output "acr_id" {
  value = module.acr.acr_id

}

output "acr_login_server" {
  value = module.acr.acr_login_server
}

