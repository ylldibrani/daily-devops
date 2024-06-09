provider "azurerm" {
  features {}
}

provider "kubernetes" {
  host                   = "https://${data.azurerm_kubernetes_cluster.aks.fqdn}"
  client_key             = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  client_certificate     = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
}