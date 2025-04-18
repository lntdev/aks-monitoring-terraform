resource "azurerm_subnet" "aks_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes       = [var.subnet_cidr]
  # security_group = azurerm_network_security_group.securitygp.id
  service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
}

# resource "azurerm_subnet" "aks_subnet2" {
#   name                 = var.subnet_name2
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes       = [var.subnet2_cidr]
#   # security_group = azurerm_network_security_group.securitygp.id
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
# }

# resource "azurerm_subnet" "aks_subnet3" {
#   name                 = var.subnet_name3
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes       = [var.subnet3_cidr]
#   # security_group = azurerm_network_security_group.securitygp.id
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
# }

# resource "azurerm_subnet" "aks_subnet4" {
#   name                 = var.subnet_name4
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes       = [var.subnet4_cidr]
#   # security_group = azurerm_network_security_group.securitygp.id
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
# }

# resource "azurerm_subnet" "aks_subnet5" {
#   name                 = var.subnet_name5
#   resource_group_name  = var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.aks_vnet.name
#   address_prefixes       = [var.subnet5_cidr]
#   # security_group = azurerm_network_security_group.securitygp.id
#   service_endpoints    = ["Microsoft.Sql", "Microsoft.Storage", "Microsoft.KeyVault"]
# }




resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.vnet_name
  address_space       = [var.address_space]
  resource_group_name = var.resource_group_name
  location            = var.location
  # tags = {
  #   environment = "Production"
  # }
}


# resource "azurerm_network_security_group" "securitygp" {
#   name                = var.security_group
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   security_rule {
#     name                       = "test123"
#     priority                   = 100
#     direction                  = "Inbound"
#     access                     = "Allow"
#     protocol                   = "Tcp"
#     source_port_range          = "*"
#     destination_port_range     = "*"
#     source_address_prefix      = "*"
#     destination_address_prefix = "*"
#   }
# }

# resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
#   # name = var.subnet_name
#   subnet_id = azurerm_subnet.aks_subnet.id
#   network_security_group_id = azurerm_network_security_group.securitygp.id
  
# }

# resource "azurerm_virtual_network" "aks_vnet" {
#   name                = var.vnet_name
#   location            = var.location
#   resource_group_name = var.resource_group_name
#   address_space       = ["10.0.0.0/16"]
#   dns_servers         = ["10.0.0.4", "10.0.0.5"]

#   # subnet {
#   #   name           = "subnet1"
#   #   address_prefix = "10.0.1.0/24"
#   # }

#   subnet {
#     name           = var.subnet_name
#     address_prefix = "10.0.0.0/24"
#     security_group = azurerm_network_security_group.securitygp.id
#   }

#   tags = {
#     environment = "Production"
#   }
# }


