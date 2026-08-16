resource "azurerm_resource_group" "UK_RG" {
  for_each   = var.rg
  name       = each.key
  location   = each.value.location
  managed_by = each.value.manage
  tags       = each.value.tags
}