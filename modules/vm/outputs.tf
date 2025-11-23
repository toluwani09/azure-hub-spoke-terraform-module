resource "azurerm_linux_virtual_machine" "vm1" {
  name                = var.vm1_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm1_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.vm1_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }
}

resource "azurerm_linux_virtual_machine" "vm2" {
  name                = var.vm2_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm2_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.vm2_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = "latest"
  }
}

output "vm1_public_ip" {
  value = azurerm_public_ip.vm1_ip.ip_address
}

output "vm2_public_ip" {
  value = azurerm_public_ip.vm2_ip.ip_address
}

output "vm1_id" {
  value = azurerm_linux_virtual_machine.vm1.id
}

output "vm2_id" {
  value = azurerm_linux_virtual_machine.vm2.id
}