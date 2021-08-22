output "vault_private_endpoint_url" {
  value = concat(hcp_vault_cluster.vault_cluster.*.vault_private_endpoint_url, [""])[0]
}

output "vault_public_endpoint_url" {
  value = concat(hcp_vault_cluster.vault_cluster.*.vault_public_endpoint_url, [""])[0]
}

output "vault_cluster_id" {
  value = concat(hcp_vault_cluster.vault_cluster.*.cluster_id, [""])[0]
}

output "vault_tier" {
  value = concat(hcp_vault_cluster.vault_cluster.*.tier, [""])[0]
}

output "vault_version" {
  value = concat(hcp_vault_cluster.vault_cluster.*.vault_version, [""])[0]
}

output "vault_token" {
  value = local.output_vault_token_nonsensitive
}

output "consul_cluster_id" {
  value = concat(hcp_consul_cluster.consul_cluster.*.cluster_id, [""])[0]
}

output "consul_private_endpoint_url" {
  value = concat(hcp_consul_cluster.consul_cluster.*.consul_private_endpoint_url, [""])[0]
}

output "consul_public_endpoint_url" {
  value = concat(hcp_consul_cluster.consul_cluster.*.consul_public_endpoint_url, [""])[0]
}

output "consul_tier" {
  value = concat(hcp_consul_cluster.consul_cluster.*.tier, [""])[0]
}

output "consul_size" {
  value = concat(hcp_consul_cluster.consul_cluster.*.size, [""])[0]
}

output "consul_version" {
  value = concat(hcp_consul_cluster.consul_cluster.*.consul_version, [""])[0]
}

output "consul_token" {
  value = local.output_consul_token_nonsensitive
}

output "consul_k8s_token" {
  value = local.output_consul_k8s_token_nonsensitive
}