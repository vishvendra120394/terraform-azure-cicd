data "azurerm_subnet" "data_sub" {
  for_each             = var.nic
  name                 = each.value.subnet
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.nw
}

data "azurerm_public_ip" "data_pip" {
  for_each            = var.nic
  name                = each.value.pip
  resource_group_name = each.value.rg

}