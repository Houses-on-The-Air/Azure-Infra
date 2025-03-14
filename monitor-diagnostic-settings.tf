



# Connect AKS to Log Analytics and Storage Account
resource "azurerm_monitor_diagnostic_setting" "aks" {
  count                      = length(azurerm_kubernetes_cluster.aks)
  name                       = "aks-diag-${count.index}"
  target_resource_id         = azurerm_kubernetes_cluster.aks[count.index].id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  storage_account_id         = azurerm_storage_account.diagnostics.id

  enabled_log {
    category = "kube-apiserver"
  }

  enabled_log {
    category = "kube-audit"
  }

  enabled_log {
    category = "kube-controller-manager"
  }

  enabled_log {
    category = "kube-scheduler"
  }

  enabled_log {
    category = "cluster-autoscaler"
  }

  metric {
    category = "AllMetrics"
    # Retention is now managed by azurerm_storage_management_policy resource
  }
}

# Add diagnostic settings for Key Vault as well
resource "azurerm_monitor_diagnostic_setting" "keyvault" {
  name                       = "kv-diag"
  target_resource_id         = azurerm_key_vault.this.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.this.id
  storage_account_id         = azurerm_storage_account.diagnostics.id

  enabled_log {
    category = "AuditEvent"
  }

  metric {
    category = "AllMetrics"
  }
}
