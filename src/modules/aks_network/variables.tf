variable "subnet_name" {
  description = "name to give the subnet"
  # default     = "default-subnet"
}
# variable "subnet_name2" {
#   description = "name to give the subnet"
#   # default     = "default-subnet"
# }
# variable "subnet_name3" {
#   description = "name to give the subnet"
#   # default     = "default-subnet"
# }
# variable "subnet_name4" {
#   description = "name to give the subnet"
#   # default     = "default-subnet"
# }
# variable "subnet_name5" {
#   description = "name to give the subnet"
#   # default     = "default-subnet"
# }

variable "resource_group_name" {
  description = "resource group that the vnet resides in"
  # default     = "Run IT on Cloud"
}

variable "vnet_name" {
  description = "name of the vnet that this subnet will belong to"
  default     = "vnet"
}

variable "subnet_cidr" {
  description = "the subnet cidr range"
}

# variable "subnet2_cidr" {
#   description = "the subnet cidr range"
# }


# variable "subnet3_cidr" {
#   description = "the subnet cidr range"
# }

# variable "subnet4_cidr" {
#   description = "the subnet cidr range"
# }

# variable "subnet5_cidr" {
#   description = "the subnet cidr range"
# }

variable "location" {
  description = "the cluster location"
}

variable "address_space" {
  description = "Network address space"
}


variable "security_group" {
  description = "Name of the security groups"
  default = "rsa-security-group"
  
}
