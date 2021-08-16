output "vault_private_endpoint_url" {
  value = hcp_vault_cluster.vault_cluster[0].vault_private_endpoint_url
}

output "vault_public_endpoint_url" {
  value = hcp_vault_cluster.vault_cluster[0].vault_public_endpoint_url
}

output "vault_cluster_id" {
  value = hcp_vault_cluster.vault_cluster[0].cluster_id
}

output "vault_tier" {
  value = hcp_vault_cluster.vault_cluster[0].tier
}

output "vault_version" {
  value = hcp_vault_cluster.vault_cluster[0].vault_version
}

output "vault_token" {
  value = local.output_vault_token_nonsensitive
}

output "consul_cluster_id" {
  value = hcp_consul_cluster.consul_cluster[0].cluster_id
}

output "consul_private_endpoint_url" {
  value = hcp_consul_cluster.consul_cluster[0].consul_private_endpoint_url
}

output "consul_public_endpoint_url" {
  value = hcp_consul_cluster.consul_cluster[0].consul_public_endpoint_url
}

output "consul_tier" {
  value = hcp_consul_cluster.consul_cluster[0].tier
}

output "consul_size" {
  value = hcp_consul_cluster.consul_cluster[0].size
}

output "consul_version" {
  value = hcp_consul_cluster.consul_cluster[0].consul_version
}

output "consul_token" {
  value = local.output_consul_token_nonsensitive
}

output "consul_k8s_token" {
  value = local.output_consul_k8s_token_nonsensitive
}