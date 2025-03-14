resource "azurerm_key_vault" "this" {

  name                        = "kv-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "premium"
  enabled_for_disk_encryption = true
  purge_protection_enabled    = true
  soft_delete_retention_days  = 90
  enable_rbac_authorization   = false

  network_acls {
    default_action             = "Deny"
    bypass                     = "AzureServices"
    virtual_network_subnet_ids = [azurerm_subnet.subnet[0].id, azurerm_subnet.subnet[1].id]
    ip_rules                   = var.authorized_ip_ranges
  }

  public_network_access_enabled = false

  tags = merge(
    var.tags,
    {
      environment = var.environment
      application = var.app_name
      managed_by  = "terraform"
      security    = "critical"
    }
  )
}

# Add Key Vault contacts as a separate resource instead of inline
resource "azurerm_key_vault_certificate_contacts" "this" {
  key_vault_id = azurerm_key_vault.this.id

  contact {
    email = "security@yourdomain.com"
    name  = "Security Team"
    phone = "555-555-5555"
  }
}
