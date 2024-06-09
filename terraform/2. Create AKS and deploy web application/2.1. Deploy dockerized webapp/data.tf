data "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-ylldibrani-westeu-001"
  resource_group_name = "rg-aks-ylldibrani-westeu-001"
}