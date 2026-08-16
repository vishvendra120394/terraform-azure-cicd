data "azurerm_key_vault" "UK_Vault" {
  for_each            = var.vm
  name                = each.value.kvname
  resource_group_name = each.value.rg
}

data "azurerm_key_vault_secret" "vmuser" {
  for_each     = var.vm
  name         = each.value.secret
  key_vault_id = data.azurerm_key_vault.UK_Vault[each.key].id

}
data "azurerm_network_interface" "uk_nic" {
  for_each            = var.vm
  name                = each.value.NIC
  resource_group_name = each.value.rg
}