module "hcp" {
  source                = "../../"
  region                = "us-west-2"
  consul_tier           = "development"
  consul_size           = "x_small"
  vault_tier            = "dev"
  single_hvn            = true
  create_consul_cluster = true
  generate_consul_token = true
  output_consul_token   = true
  create_vault_cluster  = true
  generate_vault_token  = true
  output_vault_token    = true
}
