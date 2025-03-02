resource "azurerm_virtual_network_peering" "peer" {
  count                     = 2
  name                      = "peer-${var.environment}-${local.region_abbr}-${var.app_name}-${count.index == 0 ? "h2s" : "s2h"}-${random_string.this.result}"
  resource_group_name       = azurerm_resource_group.rg.name
  virtual_network_name      = azurerm_virtual_network.vnet[count.index].name
  remote_virtual_network_id = azurerm_virtual_network.vnet[count.index == 0 ? 1 : 0].id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false

  depends_on = [azurerm_virtual_network.vnet]
}
