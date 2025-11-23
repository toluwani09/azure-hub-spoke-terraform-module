output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "vnet_ids" {
  value = module.network.vnet_ids
}

output "subnet_ids" {
  value = module.network.subnet_ids
}

output "nsg_ids" {
  value = module.nsg.nsg_ids
}

output "vm_public_ips" {
  value = module.vm.public_ips
}

output "agent_id" {
  value = module.self_hosted_agent.agent_id
}