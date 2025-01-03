terraform {
  required_version = ">= 1.10"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.49.1"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

# Providers
provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "random" {
}
