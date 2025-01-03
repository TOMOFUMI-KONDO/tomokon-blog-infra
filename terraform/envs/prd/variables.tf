variable "os_user_name" {
  description = "OpenStack user name"
  type        = string
  default     = "admin"
}
variable "os_tenant_name" {
  description = "OpenStack tenant name"
  type        = string
  default     = "admin"
}
variable "os_password" {
  description = "OpenStack password"
  type        = string
}
variable "os_auth_url" {
  description = "OpenStack auth URL"
  type        = string
  default     = "http://localhost:5000/v3"
}
variable "os_region" {
  description = "OpenStack region"
  type        = string
  default     = "RegionOne"
}
variable "cidr_mgmt" {
  description = "CIDR for the management network"
  type        = string
  default     = "192.168.0.0/24"
}
variable "keypair" {
  description = "Keypair name"
  type        = string
  default     = "mykey"
}

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
