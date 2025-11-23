variable "hub_vnet_name" {
  description = "The name of the Hub VNet"
  type        = string
}

variable "hub_vnet_address_space" {
  description = "The address space for the Hub VNet"
  type        = list(string)
}

variable "spoke_vnet_names" {
  description = "The names of the Spoke VNets"
  type        = list(string)
}

variable "spoke_vnet_address_spaces" {
  description = "The address spaces for the Spoke VNets"
  type        = list(list(string))
}

variable "subnet_names" {
  description = "The names of the subnets in the Hub VNet"
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "The address prefixes for the subnets in the Hub VNet"
  type        = list(string)
}

variable "spoke_subnet_names" {
  description = "The names of the subnets in the Spoke VNets"
  type        = list(list(string))
}

variable "spoke_subnet_prefixes" {
  description = "The address prefixes for the subnets in the Spoke VNets"
  type        = list(list(string))
}

variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
}