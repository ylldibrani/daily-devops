data "azurerm_subnet" "subnet" {
  name                 = "subnet-aks"
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  resource_group_name  = azurerm_resource_group.vnet_resource_group.name
}