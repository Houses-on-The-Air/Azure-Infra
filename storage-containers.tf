resource "azurerm_storage_container" "diagnostics" {
  name                  = "diagnostics"
  storage_account_name  = azurerm_storage_account.diagnostics.name
  container_access_type = "private"
}
