module "hcp" {
  source               = "../../"
  region               = "us-west-2"
  vault_tier           = "dev"
  hvn_vault_cidr_block = "172.25.16.0/20"
  create_vault_cluster = true
  generate_vault_token = true
  output_vault_token   = true
}
