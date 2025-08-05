# Définition de la machine virtuelle à créer
resource "proxmox_virtual_environment_vm" "client-server" {
  name      = "client-server-01"
  vm_id     = 203
  node_name = "iLO"
  on_boot   = true

  clone {
    vm_id = 100 # ID de votre template
    full  = true
  }
  
  agent {
    enabled = true
  }

  cpu {
    cores = 4
    type  = "host"
  }

  memory {
    dedicated = 8192
  }

  disk {
    interface = "scsi0"
    size      = 20
  }
  
  boot_order = ["scsi0"]
  
  initialization {
    user_account {
      username = "moi"
      password = "123"
      keys     = [var.proxmox_ssh_key]
    }

    ip_config {
      ipv4 {
        address = "192.168.2.153/16"
        gateway = "192.168.1.1"
      }
    }
  }
}

