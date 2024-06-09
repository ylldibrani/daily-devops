resource "azurerm_resource_group" "vnet_resource_group" {
  name     = "vnet"
  location = var.location
}

resource "azurerm_virtual_network" "aks_vnet" {
  name                = "vnet-ylldibrani-aks-001"
  location            = var.location
  resource_group_name = azurerm_resource_group.vnet_resource_group.name
  address_space       = ["10.123.0.0/19"]

  subnet {
    name           = "subnet-aks"
    address_prefix = "10.123.16.0/21"
  }

  tags = {
    environment = "test"
  }
}

module "aks_cluster" {
  source              = "https://github.com/ylldibrani/daily-devops//terraform/modules/tf-aks"
  aks_cluster_name    = var.aks_cluster_name
  kubernetes_version  = var.kubernetes_version
  resource_group_name = var.resource_group_name
  location            = var.location

  tags = {
    environment = "test"
  }

  default_node_pool_name                = var.default_node_pool_name
  default_node_pool_vm_size             = var.default_node_pool_vm_size
  default_vnet_subnet_id                = data.azurerm_subnet.subnet.id
  default_node_pool_availability_zones  = var.default_node_pool_availability_zones
  default_node_pool_enable_auto_scaling = var.default_node_pool_enable_auto_scaling
  default_node_pool_node_count          = var.default_node_pool_node_count
}