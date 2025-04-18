variable "dns_prefix" {
  description = "DNS prefix"
}

variable "location" {
  description = "azure location to deploy resources"
}

variable "cluster_name" {
  description = "AKS cluster name"
}

variable "resource_group_name" {
  description = "name of the resource group to deploy AKS cluster in"
}

variable "kubernetes_version" {
  description = "version of the kubernetes cluster"
}

variable "api_server_authorized_ip_ranges" {
  description = "ip ranges to lock down access to kubernetes api server"
  default     = "0.0.0.0/0"
}

# Node Pool config
variable "agent_pool_name" {
  description = "name for the agent pool profile"
  default     = "default"
}

variable "agent_pool_type" {
  description = "type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
  default     = "VirtualMachineScaleSets"
}

variable "node_count" {
  description = "number of nodes to deploy"
}

variable "vm_size" {
  description = "size/type of VM to use for nodes"
}


variable "os_disk_size_gb" {
  description = "size of the OS disk to attach to the nodes"
}

variable "vnet_subnet_id" {
  description = "vnet id where the nodes will be deployed"
}

variable "max_pods" {
  description = "maximum number of pods that can run on a single node"
}

#Network Profile config
variable "network_plugin" {
  description = "network plugin for kubenretes network overlay (azure or calico)"
  default     = "azure"
}

variable "service_cidr" {
  description = "kubernetes internal service cidr range"
  default     = "192.168.188.0/22"
}

variable "diagnostics_workspace_id" {
  description = "log analytics workspace id for cluster audit"
}
variable "client_id" {}
variable "client_secret" {}

variable "min_count" {
  #default     = 1
  description = "Minimum Node Count"
}
variable "max_count" {
  #default     = 5
  description = "Maximum Node Count"
}
variable "default_pool_name" {
  description = "name for the agent pool profile"
  default     = "default"
}
variable "default_pool_type" {
  description = "type of the agent pool (AvailabilitySet and VirtualMachineScaleSets)"
  default     = "VirtualMachineScaleSets"
}

variable "outbound_type" {
  description = "network plugin for kubenretes network overlay (azure or calico)"
  default     = "userDefinedRouting"
}

variable "ssh_public_key" {
  default = "~/.ssh/id_rsa.pub"
}


variable "datadog_api_key" {
  type      = string
  sensitive = true
  description = "API key for authenticating with Datadog"
}
variable "nat_gateway_ip" {
  description = "IP address of the NAT Gateway or Virtual Appliance to use as next hop"
  type        = string
  default = "10.0.1.4"
}



