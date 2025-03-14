# Create a storage management policy for proper retention
resource "azurerm_storage_management_policy" "lifecycle" {
  storage_account_id = azurerm_storage_account.diagnostics.id

  rule {
    name    = "diagnostics-logs-lifecycle"
    enabled = true
    filters {
      prefix_match = ["diagnostics/"]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_cool_after_days_since_modification_greater_than    = 30
        tier_to_archive_after_days_since_modification_greater_than = 90
        delete_after_days_since_modification_greater_than          = 365
      }
      snapshot {
        delete_after_days_since_creation_greater_than = 30
      }
      version {
        delete_after_days_since_creation = 90
      }
    }
  }
}
