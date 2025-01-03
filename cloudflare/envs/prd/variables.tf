variable "cloudflare_token" {
  type        = string
  description = "Cloudflare API token created at https://dash.cloudflare.com/profile/api-tokens"
  sensitive   = true
}

variable "cloudflare_account_id" {
  type        = string
  description = "Cloudflare Account ID"
}

variable "cloudflare_zone_name" {
  type        = string
  description = "Cloudflare Zone Name"
}

variable "subdomain" {
  type        = string
  description = "Subdomain to create the tunnel for"
  default     = "blog"
}
