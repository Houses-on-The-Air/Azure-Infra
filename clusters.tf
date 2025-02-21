resource "azurerm_kubernetes_cluster" "aks" {
  count               = 2
  name                = "aks-${var.environment}-${local.region_abbr}-${var.app_name}-${count.index == 0 ? "mgmt" : var.app_name}-${random_string.this.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }
}
