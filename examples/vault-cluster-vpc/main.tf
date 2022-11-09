module "hcp" {
  source               = "../../"
  region               = "us-west-2"
  vault_tier           = "dev"
  create_vault_cluster = true
  generate_vault_token = true
  output_vault_token   = true
}
