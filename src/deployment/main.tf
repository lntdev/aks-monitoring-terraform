resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}


 module "aks_network" {
   source              = "../modules/aks_network"
   subnet_name         = var.subnet_name
   vnet_name           = var.vnet_name
   resource_group_name = azurerm_resource_group.aks.name
   subnet_cidr         = var.subnet_cidr
   location            = azurerm_resource_group.aks.location
   address_space       = var.address_space
 }



# AKS IDs

# module "aks_identities" {
#   source       = "../modules/aks_identities"
#   cluster_name = var.cluster_name
# }

module "log_analytics" {
  source                           = "../modules/log_analytics"
  resource_group_name              = azurerm_resource_group.aks.name
  log_analytics_workspace_location = azurerm_resource_group.aks.location
  log_analytics_workspace_name     = var.log_analytics_workspace_name
  log_analytics_workspace_sku      = var.log_analytics_workspace_sku
}

# AKS Azure container registery 
module "acr" {
  source = "../modules/aks_acr"
  acr_name = var.acr_name
  location                 = azurerm_resource_group.aks.location
  resource_group_name      = azurerm_resource_group.aks.name
  vnet_subnet_id           = module.aks_network.aks_subnet_id
}

# AKS cluster mudle 
module "aks_cluster" {
  source                   = "../modules/aks_cluster"
  cluster_name             = var.cluster_name
  location                 = var.location
  dns_prefix               = var.dns_prefix
  resource_group_name      = azurerm_resource_group.aks.name
  kubernetes_version       = var.kubernetes_version
  node_count               = var.node_count
  min_count                = var.min_count
  max_count                = var.max_count
  datadog_api_key          = var.datadog_api_key
  os_disk_size_gb          = "128"
  max_pods                 = "30"
  vm_size                  = var.vm_size
  vnet_subnet_id           = module.aks_network.aks_subnet_id
  # vnet_subnet_id           = var.vnet_subnet_id
  # client_id                = module.aks_identities.cluster_client_id
  # client_secret            = module.aks_identities.cluster_sp_secret
  client_id = var.client_id
  client_secret = var.client_secret
  diagnostics_workspace_id = module.log_analytics.azurerm_log_analytics_workspace
}


# module "datadog_monitoring" {
#   source           = "../modules/datadog_monitoring"
#   cluster_name             = var.cluster_name
#   datadog_api_key  = var.datadog_api_key
# }

