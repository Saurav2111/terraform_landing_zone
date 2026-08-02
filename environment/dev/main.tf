module "resource_group_import" {
  source          = "../../modules/azurerm_resource_group"
  resource_groups = var.rgs
}
module "virtual_network_import" {
  depends_on      = [module.resource_group_import]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.vnets
}
module "subnet_import" {
  depends_on = [module.virtual_network_import, module.resource_group_import]
  source     = "../../modules/azurerm_subnet"
  subnet     = var.snets
}
module "public_ip_import" {
  depends_on = [module.resource_group_import]
  source     = "../../modules/azurerm_public_ip"
  public_ip  = var.pips
}
module "network_interface_card_import" {
  depends_on             = [module.resource_group_import, module.subnet_import, module.public_ip_import]
  source                 = "../../modules/azurerm_network_interface_card"
  network_interface_card = var.nics
}
module "virtual_machine_import" {
  depends_on      = [module.resource_group_import, module.network_interface_card_import]
  source          = "../../modules/azurerm_virtual_machine"
  virtual_machine = var.vms
}