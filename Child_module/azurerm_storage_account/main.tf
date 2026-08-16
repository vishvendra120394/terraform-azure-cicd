resource "azurerm_storage_account" "UK_Storage" {
  for_each                 = var.ST
  name                     = each.key
  location                 = each.value.location
  resource_group_name      = each.value.rg
  account_tier             = each.value.account_tier
  account_replication_type = each.value.rep
}