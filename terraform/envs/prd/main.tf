terraform {
  required_version = ">= 1.10.3"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 3.0.0"
    }

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.49.1"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "openstack" {
  user_name   = var.os_user_name
  tenant_name = var.os_tenant_name
  password    = var.os_password
  auth_url    = var.os_auth_url
  region      = var.os_region
}

provider "cloudflare" {
  api_token = var.cloudflare_token
}

provider "random" {
}
