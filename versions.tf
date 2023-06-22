terraform {
  required_version = ">=1.2.0"
  required_providers {
    hcp = {
      source  = "hashicorp/hcp"
      version = ">=0.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~>3.4.0"
    }
  }
}
