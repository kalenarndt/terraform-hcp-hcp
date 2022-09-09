variable "hcp_client_id" {
  description = "Client ID used to authenticate with HCP. Environment variables are preferred"
  type        = string
  sensitive   = false
  default     = null
}

variable "hcp_client_secret" {
  description = "Client secret used to authenticate with HCP. Environment variables are preferred"
  type        = string
  sensitive   = true
  default     = null
}
