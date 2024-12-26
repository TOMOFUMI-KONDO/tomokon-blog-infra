resource "openstack_networking_network_v2" "blog" {
  name = "blog"

  admin_state_up = true
  shared         = false
  external       = true

  segments {
    network_type     = "flat"
    physical_network = "provider"
  }
}

resource "openstack_networking_subnet_v2" "blog_ipv4" {
  name       = "blog_ipv4"
  network_id = openstack_networking_network_v2.blog.id

  ip_version  = 4
  enable_dhcp = true

  cidr       = "10.0.0.0/16"
  gateway_ip = "10.0.0.1"
  dns_nameservers = [
    "8.8.8.8",
    "1.1.1.1"
  ]

  allocation_pool {
    start = "10.0.1.2"
    end   = "10.0.1.254"
  }
}

resource "openstack_networking_secgroup_v2" "blog_server" {
  name = "blog_server"
}

resource "openstack_networking_secgroup_rule_v2" "blog_server_ping" {
  security_group_id = openstack_networking_secgroup_v2.blog_server.id

  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "icmp"
  remote_ip_prefix = var.cidr_mgmt
}

resource "openstack_networking_secgroup_rule_v2" "blog_server_ssh" {
  security_group_id = openstack_networking_secgroup_v2.blog_server.id

  direction        = "ingress"
  ethertype        = "IPv4"
  protocol         = "tcp"
  port_range_min   = 22
  port_range_max   = 22
  remote_ip_prefix = var.cidr_mgmt
}
