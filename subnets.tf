resource "azurerm_subnet" "subnet" {
  count                = 2
  name                 = "snet-${var.environment}-${local.region_abbr}-${var.app_name}-${count.index == 0 ? "hub" : "spoke"}-${random_string.this.result}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet[0].name
  address_prefixes     = ["10.${count.index}.1.0/24"]
}
