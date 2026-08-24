resource "azurerm_key_vault" "UK_Vault" {
  for_each                    = var.vault
  name                        = each.key
  location                    = each.value.location
  resource_group_name         = each.value.rg
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = true
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
}