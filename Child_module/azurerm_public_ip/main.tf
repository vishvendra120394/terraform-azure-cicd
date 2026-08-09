resource "azurerm_public_ip" "Public_ip" {
  for_each            = var.pip
  name                = each.key
  resource_group_name = each.value.rg
  location            = each.value.location
  allocation_method   = "Static"
}