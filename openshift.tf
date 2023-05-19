# Recurso de Droplet para el nodo maestro de OpenShift OKD
resource "digitalocean_droplet" "master" {
  name      = "okd-master"
  image     = "centos-stream-9-x64"
  region    = "nyc1"
  size      = "s-4vcpu-16gb"
  private_networking = true
  tags      = ["okd-master"]
}

# Recurso de Droplet para los nodos de trabajo de OpenShift OKD
# resource "digitalocean_droplet" "worker" {
#   count     = 3
#   name      = "okd-worker-${count.index}"
#   image     = "centos-stream-9-x64"
#   region    = "nyc1"
#   size      = "s-2vcpu-4gb"
#   private_networking = true
#   tags      = ["okd-worker"]
# }

# Recurso de Firewall para permitir el tráfico necesario
resource "digitalocean_firewall" "okd" {
  name    = "okd-firewall"
  
  inbound_rule {
    protocol    = "tcp"
    port_range  = "22"
    source_addresses  = ["0.0.0.0/0"]
  }
  
  inbound_rule {
    protocol    = "tcp"
    port_range  = "80"
    source_addresses  = ["0.0.0.0/0"]
  }
  
  inbound_rule {
    protocol    = "tcp"
    port_range  = "443"
    source_addresses  = ["0.0.0.0/0"]
  }

  inbound_rule {
    protocol    = "tcp"
    port_range  = "8443"
    source_addresses  = ["0.0.0.0/0"]
  }
}

# # Recurso de Floating IP Assignment
# resource "digitalocean_floating_ip_assignment" "master_ip_assignment" {
#   droplet_id      = digitalocean_droplet.master.id
#   ip_address      = digitalocean_floating_ip.master_ip.id
# }

# resource "digitalocean_floating_ip" "master_ip" {
#   droplet_id = digitalocean_droplet.master.id
#   region = "nyc1"
# }

# # Output para mostrar la IP flotante
# output "master_ip" {
#   value = digitalocean_floating_ip.master_ip.id
# }
