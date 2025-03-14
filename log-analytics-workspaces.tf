
resource "azurerm_log_analytics_workspace" "this" {
  name                = "log-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = local.common_tags
}
