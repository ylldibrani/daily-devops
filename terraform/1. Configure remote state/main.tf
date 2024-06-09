resource "azurerm_resource_group" "test-resource-group" {
  name     = var.rg_name
  location = var.location
}