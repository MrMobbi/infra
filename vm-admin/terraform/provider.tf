terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.45.0"
    }
  }
}

variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}

variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}

variable "proxmox_api_url" {
  type      = string
  sensitive = true
}

variable "proxmox_ssh_key" {
  type      = string
}

# Configuration de la connexion à l'API de Proxmox
provider "proxmox" {
  endpoint  = var.proxmox_api_url
  api_token = "${var.proxmox_api_token_id}=${var.proxmox_api_token_secret}"
  insecure  = true
}

