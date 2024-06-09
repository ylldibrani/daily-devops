variable "aks_cluster_name" {
  type        = string
  description = "(Required) Specifies the name of the AKS cluster."
}

variable "resource_group_name" {
  description = "(Required) Specifies the name of the resource group."
  type        = string
}

variable "location" {
  description = "(Required) Specifies the location where the AKS cluster will be deployed."
  type        = string
}

variable "kubernetes_version" {
  description = "Specifies the AKS Kubernetes version"
  type        = string
}

variable "default_node_pool_vm_size" {
  description = "Specifies the vm size of the default node pool"
  type        = string
}

variable "default_node_pool_availability_zones" {
  description = "Specifies the availability zones of the default node pool"
  type        = list(string)
}

variable "default_node_pool_name" {
  description = "Specifies the name of the default node pool"
  type        = string
}

variable "default_node_pool_enable_auto_scaling" {
  description = "(Optional) Whether to enable auto-scaler. Defaults to false."
  type        = bool
}

variable "default_node_pool_node_count" {
  description = "(Optional) The initial number of nodes which should exist within this Node Pool. Valid values are between 0 and 1000 and must be a value in the range min_count - max_count."
  type        = number
}

variable "tags" {
  description = "(Optional) Specifies the tags of the network security group"
  type        = map(any)
}

variable "default_vnet_subnet_id" {
  description = "(Optional) The ID of the Subnet where this Node Pool should exist."
  type        = string
}

variable "default_node_pool_max_count" {
  type        = number
  default     = 3
  description = "(Optional) The maximum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}

variable "default_node_pool_min_count" {
  type        = number
  default     = 1
  description = "(Optional) The minimum number of nodes which should exist in this Node Pool. If specified this must be between 1 and 1000."
}