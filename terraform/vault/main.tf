terraform {
  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.4.0"
    }
  }
}

provider "vault" {
  address = "https://vault.local.soulkyu.net:443"
  skip_tls_verify = true
}

# Enable KV-V2 secrets engine
resource "vault_mount" "kvv2" {
  path        = "secrets"
  type        = "kv"
  options     = { version = "2" }
  description = "KV Version 2 secret engine"
}

# Enable Kubernetes auth method
resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  path = "kubernetes"
}

# Configure Kubernetes auth backend
resource "vault_kubernetes_auth_backend_config" "config" {
  backend            = vault_auth_backend.kubernetes.path
  kubernetes_host    = "https://kubernetes.default.svc"
  disable_local_ca_jwt = false
}