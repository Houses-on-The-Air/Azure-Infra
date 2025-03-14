resource "azurerm_resource_group" "rg" {
  name     = "rg-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location = var.location
  tags = merge(
    var.tags,
    {
      environment = var.environment
      application = var.app_name
      managed_by  = "terraform"
    }
  )
}
