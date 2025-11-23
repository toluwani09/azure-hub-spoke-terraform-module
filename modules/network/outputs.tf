resource "azurerm_virtual_network" "hub" {
  name                = var.hub_vnet_name
  address_space       = var.hub_vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_network" "spoke" {
  count               = length(var.spoke_vnet_names)
  name                = var.spoke_vnet_names[count.index]
  address_space       = var.spoke_vnet_address_spaces[count.index]
  location            = var.location
  resource_group_name = var.resource_group_name
}

output "hub_vnet_id" {
  value = azurerm_virtual_network.hub.id
}

output "spoke_vnet_ids" {
  value = azurerm_virtual_network.spoke[*].id
}