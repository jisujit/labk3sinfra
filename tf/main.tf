//TODO:$1: add provider for proxmox
//TODO:$3: add url to the tutorial 
//Ref: https://registry.terraform.io/modules/fvumbaca/k3s/proxmox/latest

module "k3s" {
  source  = "fvumbaca/k3s/proxmox"
  version = "0.1.2"
  # insert the 9 required variables here
  //REQD_Field:1: authorized_keys_file
  authorized_keys_file = "authorized_keys"

  //REQD_Field:2: control_plane_subnet
  # 192.168.0.200 -> 192.168.0.207 (6 available IPs for nodes)
  control_plane_subnet = "192.168.0.200/29"

  //REQD_Field:3: lan_subnet
  #Subnet used by the LAN network.
  lan_subnet = "192.168.9.1/24"


}
/*module "k3s" {
  source  = "fvumbaca/k3s/proxmox"
  version = ">= 0.0.0, < 1.0.0" # Get latest 0.X release
  //Reqd  
  authorized_keys_file = "authorized_keys"

  proxmox_node = "my-proxmox-node"

  node_template         = "ubuntu-template"
  proxmox_resource_pool = "my-k3s"

  network_gateway = "192.168.0.1"
  lan_subnet      = "192.168.0.0/24"

  support_node_settings = {
    cores  = 2
    memory = 4096
  }

  # Disable default traefik and servicelb installs for metallb and traefik 2
  k3s_disable_components = [
    "traefik",
    "servicelb"
  ]

  master_nodes_count = 2
  master_node_settings = {
    cores  = 2
    memory = 4096
  }

  # 192.168.0.200 -> 192.168.0.207 (6 available IPs for nodes)
  control_plane_subnet = "192.168.0.200/29"

  node_pools = [
    {
      name = "default"
      size = 2
      # 192.168.0.208 -> 192.168.0.223 (14 available IPs for nodes)
      subnet = "192.168.0.208/28"
    }
  ]
}
*/
