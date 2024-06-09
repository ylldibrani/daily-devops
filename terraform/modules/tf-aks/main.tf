resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                             = var.aks_cluster_name
  location                         = azurerm_resource_group.rg.location
  resource_group_name              = azurerm_resource_group.rg.name
  kubernetes_version               = var.kubernetes_version
  private_cluster_enabled          = false
  http_application_routing_enabled = true

  dns_prefix = "aks-ylldibrani-test"

  tags = var.tags

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                = var.default_node_pool_name
    vm_size             = var.default_node_pool_vm_size
    vnet_subnet_id      = var.default_vnet_subnet_id
    zones               = var.default_node_pool_availability_zones
    node_labels         = {}
    node_taints         = []
    enable_auto_scaling = var.default_node_pool_enable_auto_scaling
    node_count          = var.default_node_pool_node_count
    os_disk_type        = "Managed"
  }

  network_profile {
    docker_bridge_cidr = "172.17.0.1/16"
    dns_service_ip     = "10.0.0.10"
    network_plugin     = "azure"
    service_cidr       = "10.0.0.0/16"
  }
}