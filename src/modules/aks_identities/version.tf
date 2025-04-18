# terraform {
#   required_version = ">= 0.12"
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

