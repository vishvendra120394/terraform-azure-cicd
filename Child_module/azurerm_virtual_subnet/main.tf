resource "azurerm_subnet" "uk_subnet" {
  for_each             = var.subnet
  name                 = each.key
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.nw
  address_prefixes     = each.value.ip

}