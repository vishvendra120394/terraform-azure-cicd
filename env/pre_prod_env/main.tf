module "azurerm_resource_group" {
  source = "../../Child_module/azurerm_resource_group"
  rg     = var.rg
}

module "azure_storage" {
  source     = "../../Child_module/azurerm_storage_account"
  ST         = var.ST
  depends_on = [module.azurerm_resource_group]
}

module "azure_network" {
  source     = "../../Child_module/azurerm_virtual_network"
  network    = var.network
  depends_on = [module.azurerm_resource_group]
}

module "azurerm_subnet" {
  source     = "../../Child_module/azurerm_virtual_subnet"
  subnet     = var.subnet
  depends_on = [module.azure_network, module.azurerm_resource_group]
}

module "azurerm_public_ip" {
  source = "../../Child_module/azurerm_public_ip"
  pip    = var.pip
}

module "azurerm_network_interface" {
  source     = "../../Child_module/azure_network_interface"
  nic        = var.nic
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip, module.azure_network]
}
module "azurerm_virtual_machine" {
  source     = "../../Child_module/azure_virtual_machine"
  vm         = var.vm
  nic        = var.nic
  depends_on = [module.azurerm_resource_group, module.azurerm_public_ip, module.azure_network, module.azurerm_key_vault]
}

module "azurerm_key_vault" {
  source     = "../../Child_module/azurerm_key_vault"
  vault      = var.vault
  depends_on = [module.azurerm_resource_group, module.azure_storage]
}