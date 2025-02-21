resource "azurerm_subnet_network_security_group_association" "ass" {
  count                     = 2
  subnet_id                 = azurerm_subnet.subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}
