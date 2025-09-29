output "vpc_id" { value = digitalocean_vpc.vpc.id }
output "droplet_id" { value = digitalocean_droplet.vm.id }
output "droplet_ip" { value = digitalocean_droplet.vm.ipv4_address }
