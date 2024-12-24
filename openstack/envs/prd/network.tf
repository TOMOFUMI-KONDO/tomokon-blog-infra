resource "openstack_networking_network_v2" "provider" {
  name           = "provider"
  admin_state_up = true
  tenant_id      = data.openstack_identity_project_v3.admin.id

  shared   = false
  external = true

  segments {
    network_type     = "flat"
    physical_network = "provider"
  }
}
