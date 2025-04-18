variable "resource_group_name" {
  description = "name of the resource group to deploy AKS cluster in"
}

variable "location" {
  description = "azure location to deploy resources"
}

variable "acr_name" {
  type        = string
  description = "ACR name"
}

variable "sku" {
  description = "The SKU name of the container registry"
  default     = "Premium"
}

variable "content_trust" {
  description = "Set to true to enable Docker Content Trust on registry."
  type        = bool
  default     = true
}

variable "vnet_subnet_id" {
  description = "vnet id where the nodes will be deployed"
}

