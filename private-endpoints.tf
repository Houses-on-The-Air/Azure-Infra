resource "azurerm_private_endpoint" "this" {
  name                = "pe-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet[0].id

  private_service_connection {
    name                           = "psc-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
    private_connection_resource_id = azurerm_key_vault.this.id
    is_manual_connection           = false
    subresource_names              = ["vault"]
  }
}
