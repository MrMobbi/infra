module "servers" {
  source = "./servers"

  proxmox_api_token_id     = var.proxmox_api_token_id
  proxmox_api_token_secret = var.proxmox_api_token_secret
  proxmox_api_url          = var.proxmox_api_url
  proxmox_ssh_key          = var.proxmox_ssh_key

  providers = {
    proxmox = proxmox
  }
}
