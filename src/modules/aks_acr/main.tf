
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  admin_enabled       = true
  public_network_access_enabled = false
  trust_policy {
    enabled = var.content_trust && var.sku == "Premium"
  }

}



