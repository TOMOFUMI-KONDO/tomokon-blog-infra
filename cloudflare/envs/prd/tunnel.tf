locals {
  fqdn = "${var.subdomain}.${var.cloudflare_zone_name}"
}

resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "main" {
  account_id = var.cloudflare_account_id
  name       = "blog"
  secret     = base64sha256(random_password.tunnel_secret.result)
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "main" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.main.id

  config {
    warp_routing {
      enabled = true
    }

    ingress_rule {
      hostname = local.fqdn
      service  = "http://localhost:80"
    }

    ingress_rule {
      service = "http_status:404"
    }
  }
}

data "cloudflare_zone" "main" {
  name = var.cloudflare_zone_name
}

resource "cloudflare_record" "example" {
  zone_id = data.cloudflare_zone.main.zone_id
  name    = var.subdomain
  content = "${cloudflare_zero_trust_tunnel_cloudflared.main.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}
