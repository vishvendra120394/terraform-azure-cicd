resource "azurerm_network_interface" "uk_nic" {
  for_each            = var.nic
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.rg
  ip_configuration {
    name                          = "nic_internal"
    subnet_id                     = data.azurerm_subnet.data_sub[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.data_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

}