module "hcp" {
  source               = "../../"
  region               = var.region
  vault_tier           = "dev"
  create_vault_cluster = true
  generate_vault_token = true
  output_vault_token   = true
}
