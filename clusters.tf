resource "azurerm_kubernetes_cluster" "aks" {
  count                   = 2
  name                    = "aks-${var.environment}-${local.region_abbr}-${var.app_name}-${count.index == 0 ? "mgmt" : var.app_name}-${random_string.this.result}"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = "aks"
  sku_tier                = var.cluster_sku_tier
  private_cluster_enabled = true
  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  default_node_pool {
    name         = "default"
    node_count   = 1
    vm_size      = "Standard_DS2_v2"
    max_pods     = 50
    os_disk_type = "Ephemeral"
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "azure"
  }


  disk_encryption_set_id = azurerm_disk_encryption_set.this.id

  linux_profile {
    admin_username = "aksuser"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  tags = {
    environment = var.environment
    app_name    = var.app_name
  }
}
