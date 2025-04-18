resource "random_id" "workspace" {
  keepers = {
    # Generate a new id each time we switch to a new resource group
    group_name = var.resource_group_name
  }

  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "test" {
  # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
  name                = "${var.log_analytics_workspace_name}-${random_id.workspace.hex}"
  location            = var.log_analytics_workspace_location
  resource_group_name = var.resource_group_name
  sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "test" {
  solution_name         = "ContainerInsights"
  location              = var.log_analytics_workspace_location
  resource_group_name   = var.resource_group_name
  workspace_resource_id = azurerm_log_analytics_workspace.test.id
  workspace_name        = azurerm_log_analytics_workspace.test.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
# resource "random_id" "log_analytics_workspace_name_suffix" {
#   byte_length = 8
# }
