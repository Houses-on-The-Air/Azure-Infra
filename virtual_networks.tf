resource "azurerm_virtual_network" "vnet" {
  count               = 2
  name                = "vnet-${var.environment}-${local.region_abbr}-${var.app_name}-hub-${random_string.this.result}"
  address_space       = ["10.${count.index}.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}
