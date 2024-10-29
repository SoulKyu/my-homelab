# Create a policy for Scaleway DNS secrets access
resource "vault_policy" "scaleway_dns" {
  name = "bank-vault"

  policy = <<EOT
path "secrets/*" {
  capabilities = ["read", "list"]
}
EOT
}

# Create a Kubernetes auth role
resource "vault_kubernetes_auth_backend_role" "scaleway_dns" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "default"
  bound_service_account_names      = ["*"]  # You might want to restrict this to specific service accounts
  bound_service_account_namespaces = ["*"]
  token_ttl                        = 3600   # 1 hour
  token_policies                   = [vault_policy.scaleway_dns.name]
}
