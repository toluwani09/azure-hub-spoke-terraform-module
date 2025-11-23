resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "network" {
  source              = "./modules/network"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  address_space      = var.address_space
  subnet_configs     = var.subnet_configs
}

module "nsg" {
  source              = "./modules/nsg"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  nsg_rules          = var.nsg_rules
}

module "vm" {
  source              = "./modules/vm"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  vm_configs         = var.vm_configs
  nsg_ids            = module.nsg.nsg_ids
}

module "self_hosted_agent" {
  source              = "./modules/self_hosted_agent"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  agent_name         = var.agent_name
  vm_ip              = module.vm.vm_public_ips
}