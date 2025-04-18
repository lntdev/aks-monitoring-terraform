output "azurerm_kubernetes_cluster_id" {
  value = azurerm_kubernetes_cluster.cluster.id
}

output "azurerm_kubernetes_cluster_fqdn" {
  value = azurerm_kubernetes_cluster.cluster.fqdn
}

output "azurerm_kubernetes_cluster_node_resource_group" {
  value = azurerm_kubernetes_cluster.cluster.node_resource_group
}



output "azurerm_kubernetes_cluster_rg" {
  value = azurerm_kubernetes_cluster.cluster.node_resource_group
}



resource "local_file" "kubeconfig" {
  depends_on   = [azurerm_kubernetes_cluster.cluster]
  filename     = "kubeconfig"
  content      = azurerm_kubernetes_cluster.cluster.kube_config_raw
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.cluster.kube_config[0]
}

output "kube_config_raw" {
  value     = azurerm_kubernetes_cluster.cluster.kube_config_raw
  sensitive = true
}



