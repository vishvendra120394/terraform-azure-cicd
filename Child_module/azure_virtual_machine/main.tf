resource "azurerm_linux_virtual_machine" "UK_Datacentre" {
  for_each                        = var.vm
  name                            = each.key
  location                        = each.value.location
  resource_group_name             = each.value.rg
  size                            = each.value.size
  admin_username                  = each.value.user
  admin_password                  = data.azurerm_key_vault_secret.vmuser[each.key].value
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.uk_nic[each.key].id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }
  source_image_reference {
    publisher = each.value.publisher
    offer     = each.value.offer
    sku       = each.value.sku
    version   = "latest"
  }

}