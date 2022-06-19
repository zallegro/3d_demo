# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }
  required_version = ">= 0.14.9"
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "vuechessk8sResourceGroup-${var.env_name}"
  location = "westeurope"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "${var.cluster_name}-${var.env_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name       = "agentpool"
    node_count = "1"
    vm_size    = "Standard_D2as_v5"
  }

  identity {
    type = "SystemAssigned"
  }

}