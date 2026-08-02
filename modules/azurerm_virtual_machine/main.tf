data "azurerm_network_interface" "network_interface_card" {
  for_each = var.virtual_machine
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}
resource "azurerm_virtual_machine" "main" {
  for_each = var.virtual_machine
  name                  = each.value.name
  location              = each.value.location
  resource_group_name   = each.value.resource_group_name
  network_interface_ids = [data.azurerm_network_interface.network_interface_card[each.key].id]
  vm_size               = "Standard_D2ls_v5"
  delete_os_disk_on_termination = true
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = each.value.os_profile.computer_name
    admin_username = each.value.os_profile.admin_username
    admin_password = each.value.os_profile.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}