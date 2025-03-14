resource "azurerm_network_security_group" "nsg" {
  name                = "nsg-${var.environment}-${local.region_abbr}-${var.app_name}-${random_string.this.result}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefixes    = var.authorized_ip_ranges
    destination_address_prefix = "*"
    description                = "Allow SSH access from authorized IP ranges only"
  }

  security_rule {
    name                       = "DenyAllInbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    description                = "Deny all other inbound traffic"
  }

  tags = merge(
    var.tags,
    {
      environment = var.environment
      application = var.app_name
      managed_by  = "terraform"
    }
  )
}
