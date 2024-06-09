terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.00"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-sa-ylldibrani-westeu-001"
    storage_account_name = "ylldibranidemosa001"
    container_name       = "tfstate"
    key                  = "aks.terraform.tfstate"
  }
}