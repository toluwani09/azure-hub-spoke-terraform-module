resource "azurerm_linux_virtual_machine" "self_hosted_agent" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.self_hosted_agent_nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    create_option        = "FromImage"
    managed_disk_type    = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}

output "self_hosted_agent_public_ip" {
  value = azurerm_public_ip.self_hosted_agent_ip.ip_address
}

output "self_hosted_agent_id" {
  value = azurerm_linux_virtual_machine.self_hosted_agent.id
}