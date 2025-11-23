resource "azurerm_devops_agent_pool" "self_hosted_agent_pool" {
  name = var.agent_pool_name
}

resource "azurerm_devops_agent" "self_hosted_agent" {
  name                = var.agent_name
  agent_pool_id      = azurerm_devops_agent_pool.self_hosted_agent_pool.id
  vm_id              = azurerm_virtual_machine.vm.id
  enable_auto_update  = true
  enable_service_endpoint = true
}

resource "azurerm_virtual_machine_extension" "agent_extension" {
  name                 = "agent-extension"
  virtual_machine_id   = azurerm_virtual_machine.vm.id
  publisher            = "Microsoft.VisualStudio.Services"
  type                 = "Agent"
  type_handler_version = "1.0"
  
  settings = jsonencode({
    agentPoolName = var.agent_pool_name
    agentName     = var.agent_name
  })
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  vm_size               = var.vm_size

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  storage_os_disk {
    name              = "${var.vm_name}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}