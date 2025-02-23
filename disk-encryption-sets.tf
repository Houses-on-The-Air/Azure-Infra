resource "azurerm_disk_encryption_set" "this" {
  name                = "es-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  key_vault_key_id    = azurerm_key_vault_key.this.versionless_id

  auto_key_rotation_enabled = true

  identity {
    type = "SystemAssigned"
  }
}
