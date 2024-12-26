data "openstack_images_image_v2" "noble" {
  name        = "ubuntu-noble"
  most_recent = true
}

resource "openstack_blockstorage_volume_v3" "blog_server" {
  name        = "blog_server"
  volume_type = "lvm"
  size        = 20
  image_id    = data.openstack_images_image_v2.noble.id
}

resource "openstack_compute_instance_v2" "blog_server" {
  name            = "blog_server"
  flavor_name     = "c1.large"
  key_pair        = var.keypair
  security_groups = [openstack_networking_secgroup_v2.blog_server.name]

  block_device {
    uuid             = openstack_blockstorage_volume_v3.blog_server.id
    source_type      = "volume"
    destination_type = "volume"
  }

  network {
    uuid = openstack_networking_network_v2.blog.id
  }
}
