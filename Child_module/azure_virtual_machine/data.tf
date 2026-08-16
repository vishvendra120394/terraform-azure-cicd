data "azurerm_network_interface" "uk_nic" {
  for_each            = var.vm
  name                = each.value.NIC
  resource_group_name = each.value.rg
}