# # create cluster kuernetes in digitalocean in project devopsparatodos
# resource "digitalocean_kubernetes_cluster" "devopsparatodos" {
#   name    = "devopsparatodos"
#   region  = "nyc3"
#   version = "1.24.4-do.0"
#   tags    = ["devopsparatodos"]
#   node_pool {
#     name       = "devopsparatodos"
#     size       = "s-1vcpu-2gb"
#     node_count = 1
#     tags       = ["devopsparatodos"]
#   }
# }
