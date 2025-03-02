resource "azurerm_key_vault_key" "this" {
  name            = "key-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  key_vault_id    = azurerm_key_vault.this.id
  key_type        = "RSA-HSM"
  key_size        = 2048
  expiration_date = "2028-12-31T00:00:00Z"

  depends_on = [
    azurerm_key_vault_access_policy.this,
    azurerm_private_endpoint.this
  ]

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}
