resource "azurerm_public_ip" "pip" {
  name                = var.public_ip_name
  location            = var.public_ip_location
  resource_group_name = var.resource_group_name
  sku                 = var.public_ip_sku
  allocation_method   = title(var.allocation_method )
}