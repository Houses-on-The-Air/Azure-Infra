resource "azurerm_key_vault" "this" {

  name                        = "kv-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.subnet[0].id, azurerm_subnet.subnet[1].id]
  }
  public_network_access_enabled = false

}
