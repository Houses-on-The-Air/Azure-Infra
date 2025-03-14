resource "azurerm_storage_account" "diagnostics" {
  name                       = "stdiag${var.environment}${local.region_abbr}${random_string.this.result}"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = azurerm_resource_group.rg.location
  account_tier               = "Standard"
  account_replication_type   = "LRS"
  account_kind               = "StorageV2"
  min_tls_version            = "TLS1_2"
  https_traffic_only_enabled = true

  # Enable hierarchical namespace for advanced data lake features
  is_hns_enabled = false

  # Add network rules for security
  network_rules {
    default_action             = "Deny"
    bypass                     = ["AzureServices"]
    ip_rules                   = var.authorized_ip_ranges
    virtual_network_subnet_ids = [azurerm_subnet.subnet[0].id, azurerm_subnet.subnet[1].id]
  }

  blob_properties {
    versioning_enabled  = true
    change_feed_enabled = true
    delete_retention_policy {
      days = 30
    }
    container_delete_retention_policy {
      days = 30
    }
  }

  tags = local.common_tags
}


