# Cluster Identity
data "azuread_client_config" "current" {}

resource "azuread_application" "cluster_aks" {
  display_name = var.cluster_name
  # name = var.cluster_name
  owners       = [data.azuread_client_config.current.object_id]
}

resource "azuread_service_principal" "cluster_sp" {
  application_id = azuread_application.cluster_aks.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}

resource "random_string" "cluster_sp_password" {
  length  = 32
  special = true
  keepers = {
    service_principal = azuread_service_principal.cluster_sp.id
  }
}
# resource "time_rotating" "time" {
#   rotation_days = 7
# }

resource "azuread_service_principal_password" "cluster_sp_password" {
  service_principal_id = azuread_service_principal.cluster_sp.id
  # value                = random_string.cluster_sp_password.result

  # 1 year since creation
  # https://www.terraform.io/docs/configuration/functions/timeadd.html
  end_date = timeadd(timestamp(), "8760h")

  lifecycle {
    ignore_changes = [end_date]
  }
}

# resource "azuread_service_principal_password" "cluster_sp_password" {
#   service_principal_id = azuread_service_principal.cluster_sp.object_id
#   rotate_when_changed = {
#     rotation = time_rotating.time.id
#   }
# }
