terraform {
  required_providers {
    hcp = {
      source = "hashicorp/hcp"
      version = "0.81.0"
    }
  }
}

provider "hcp" {
  client_id     = var.client_id
  client_secret = var.client_secret
}
