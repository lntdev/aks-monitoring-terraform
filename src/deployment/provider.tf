//terraform {
//  backend "azurerm" {}
//}

# provider "azurerm" {
#   version = "~> 2.4"
#   features {}
# }

terraform {
  required_version = ">= 1.4.2"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.22"
    }
  }
}

provider "azurerm" {
  features {}
}

# provider "helm" {
#   kubernetes {
#     host                   = module.aks_cluster.kube_config["host"]
#     client_certificate     = base64decode(module.aks_cluster.kube_config["client_certificate"])
#     client_key             = base64decode(module.aks_cluster.kube_config["client_key"])
#     cluster_ca_certificate = base64decode(module.aks_cluster.kube_config["cluster_ca_certificate"])
#   }
# }

