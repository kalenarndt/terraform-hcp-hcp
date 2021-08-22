output "consul_private_endpoint_url" {
  value = module.hcp_vault.consul_private_endpoint_url
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
