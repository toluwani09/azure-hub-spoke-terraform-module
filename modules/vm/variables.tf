variable "vm1_name" {
  description = "The name of the first Virtual Machine"
  type        = string
}

variable "vm2_name" {
  description = "The name of the second Virtual Machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machines"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "The admin username for the Virtual Machines"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the Virtual Machines"
  type        = string
  sensitive   = true
}

variable "ssh_public_key" {
  description = "The SSH public key for accessing the Virtual Machines"
  type        = string
}

variable "vnet_name" {
  description = "The name of the Virtual Network where the VMs will be deployed"
  type        = string
}

variable "subnet_name" {
  description = "The name of the Subnet where the VMs will be deployed"
  type        = string
}