resource "azurerm_application_insights" "this" {
  name                = "appi-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.this.id
  application_type    = "web"

  tags = local.common_tags
}
