resource "azurerm_kubernetes_cluster" "aks" {
  count                   = 2
  name                    = "aks-${var.environment}-${local.region_abbr}-${var.app_name}-${count.index == 0 ? "mgmt" : var.app_name}-${random_string.this.result}"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  dns_prefix              = "aks-${var.environment}-${count.index == 0 ? "mgmt" : var.app_name}"
  sku_tier                = var.cluster_sku_tier
  private_cluster_enabled = true
  kubernetes_version      = "1.28" # Specify version for better control

  api_server_access_profile {
    authorized_ip_ranges = var.authorized_ip_ranges
  }

  default_node_pool {
    name            = "system"
    node_count      = 2 # Increase for better availability
    vm_size         = "Standard_DS2_v2"
    max_pods        = 50
    os_disk_type    = "Ephemeral"
    os_disk_size_gb = 100
    vnet_subnet_id  = azurerm_subnet.subnet[count.index].id
    zones           = ["1", "2", "3"] # For high availability
    min_count       = 1
    max_count       = 3
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "userDefinedRouting"
  }

  disk_encryption_set_id = azurerm_disk_encryption_set.this.id

  linux_profile {
    admin_username = "aksuser"
    ssh_key {
      key_data = var.ssh_public_key
    }
  }

  azure_policy_enabled             = true
  http_application_routing_enabled = false

  maintenance_window {
    allowed {
      day   = "Sunday"
      hours = [21, 22, 23]
    }
  }

  auto_scaler_profile {
    balance_similar_node_groups      = true
    expander                         = "random"
    max_graceful_termination_sec     = 600
    max_unready_nodes                = 3
    new_pod_scale_up_delay           = "10s"
    scale_down_delay_after_add       = "10m"
    scale_down_delay_after_delete    = "10s"
    scale_down_delay_after_failure   = "3m"
    scan_interval                    = "10s"
    scale_down_unneeded              = "10m"
    scale_down_unready               = "20m"
    scale_down_utilization_threshold = "0.5"
  }

  tags = merge(
    var.tags,
    {
      environment = var.environment
      application = var.app_name
      managed_by  = "terraform"
      purpose     = count.index == 0 ? "management" : "application"
    }
  )
}
