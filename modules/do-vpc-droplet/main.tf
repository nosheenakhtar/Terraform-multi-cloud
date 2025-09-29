provider "digitalocean" {}

resource "digitalocean_vpc" "vpc" {
  name   = "${var.project}-vpc"
  region = var.region
  ip_range = var.vpc_cidr
}

resource "digitalocean_droplet" "vm" {
  name     = "${var.project}-droplet"
  region   = var.region
  size     = var.size
  image    = var.image
  vpc_uuid = digitalocean_vpc.vpc.id
  ssh_keys = [var.ssh_key_fingerprint]
  tags     = concat(var.tags, [var.project])
}
