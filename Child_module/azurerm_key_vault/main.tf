resource "azurerm_key_vault" "UK_Vault" {
  for_each                    = var.vault
  name                        = each.key
  location                    = each.value.location
  resource_group_name         = each.value.rg
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  sku_name                    = "standard"

  access_policy = [{
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions         = ["Get", "Create", "List"]
    secret_permissions      = ["Get", "Set", "Delete", "Purge", "Recover", "List"]
    storage_permissions     = ["Get", ]
    application_id          = null
    certificate_permissions = []
    }
  ]
}


resource "azurerm_key_vault_secret" "vmuser" {
  for_each     = var.vault
  name         = each.value.secret
  value        = each.value.PAS
  key_vault_id = azurerm_key_vault.UK_Vault[each.key].id
}