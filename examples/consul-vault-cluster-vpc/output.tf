output "vault_private_endpoint_url" {
  value = module.hcp_vault.vault_private_endpoint_url
}

output "vault_public_endpoint_url" {
  value = module.hcp_vault.vault_public_endpoint_url
}

output "vault_cluster_id" {
  value = module.hcp_vault.vault_cluster_id
}

output "vault_tier" {
  value = module.hcp_vault.vault_tier
}

output "vault_version" {
  value = module.hcp_vault.vault_version
}

output "vault_token" {
  value = module.hcp_vault.vault_token
}

output "consul_private_endpoint_url" {
  value = module.hcp_vault.consul_private_endpoint_url
}

output "consul_public_endpoint_url" {
  value = module.hcp_vault.consul_public_endpoint_url
}

output "consul_cluster_id" {
  value = module.hcp_vault.consul_cluster_id
}

output "consul_tier" {
  value = module.hcp_vault.consul_tier
}

output "consul_size" {
  value = module.hcp_vault.consul_size
}

output "consul_version" {
  value = module.hcp_vault.consul_version
}

output "consul_token" {
  value = module.hcp_vault.consul_token
}

output "consul_k8s_token" {
  value = module.hcp_vault.consul_k8s_token
}

output "ec2_bastion" {
  value = aws_instance.ec2_bastion.public_ip
}