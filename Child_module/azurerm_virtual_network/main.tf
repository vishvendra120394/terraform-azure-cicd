resource "azurerm_virtual_network" "uk_net" {
  for_each            = var.network
  name                = each.key
  resource_group_name = each.value.rg
  location            = each.value.location
  address_space       = each.value.cidr
}