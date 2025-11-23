resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  address_space       = var.hub_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "hub_subnet" {
  name                 = var.hub_subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = var.hub_subnet_prefixes
}

resource "azurerm_virtual_network" "spoke" {
  count              = var.spoke_count
  name               = "${var.spoke_vnet_name}-${count.index}"
  address_space      = var.spoke_address_space[count.index]
  location           = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "spoke_subnet" {
  count                 = var.spoke_count
  name                  = "${var.spoke_subnet_name}-${count.index}"
  resource_group_name   = var.resource_group_name
  virtual_network_name  = azurerm_virtual_network.spoke[count.index].name
  address_prefixes      = var.spoke_subnet_prefixes[count.index]
}

resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  count                     = var.spoke_count
  name                      = "hub-to-spoke-${count.index}"
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.hub.name
  remote_virtual_network_id = azurerm_virtual_network.spoke[count.index].id
  allow_virtual_network_access = true
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "hub_subnet_id" {
  value = azurerm_subnet.hub_subnet.id
}

output "spoke_vnet_ids" {
  value = azurerm_virtual_network.spoke[*].id
}

output "spoke_subnet_ids" {
  value = azurerm_subnet.spoke_subnet[*].id
}