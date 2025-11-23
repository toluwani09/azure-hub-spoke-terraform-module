variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure location where the resources will be created."
  type        = string
}

variable "hub_vnet_name" {
  description = "The name of the Hub VNet."
  type        = string
}

variable "hub_vnet_address_space" {
  description = "The address space for the Hub VNet."
  type        = list(string)
}

variable "spoke_vnet_names" {
  description = "The names of the Spoke VNets."
  type        = list(string)
}

variable "spoke_vnet_address_spaces" {
  description = "The address spaces for the Spoke VNets."
  type        = list(list(string))
}

variable "subnet_names" {
  description = "The names of the subnets."
  type        = list(string)
}

variable "nsg_names" {
  description = "The names of the Network Security Groups."
  type        = list(string)
}

variable "vm_names" {
  description = "The names of the Virtual Machines."
  type        = list(string)
}

variable "vm_sizes" {
  description = "The sizes of the Virtual Machines."
  type        = list(string)
}

variable "admin_username" {
  description = "The admin username for the Virtual Machines."
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Virtual Machines."
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "The SSH public key for accessing the Virtual Machines."
  type        = string
}