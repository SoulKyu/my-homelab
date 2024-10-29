# my-homelab
My homelab code is going to be defined here

## Homelab Hardware

My Homelab is composed of multiple micro-computer branded by Beelink and 1 NAS : 

| Model               | CPU                | RAM  | DISKS                 |
| ------------------- | ------------------ | ---- | --------------------- |
| Beelink SER5 PRO E  | AMD Ryzen 7 5800H  | 32GB | SSD 500GB / SSD 4TB   |
| Beelink GTR7 7840HS | GTR7 7840HS        | 32GB | SSD 1TB               |
| Beelink SER6        | AMD Ryzen 7 7840HS | 32GB | SSD 1TB               |
| Terramaster F2-424  | CPU N95            | 20GB | SSD 250GB / 2 HDD 8TB |

The Terramaster has been reinstalled with TrueNas using this documentation : [Install Truenas on Terramaster](https://nascompares.com/2022/08/10/how-to-install-truenas-core-on-your-terramaster-nas/). It has been extended with 1 250GB SSD and 1x 16GB of RAM.

## My Kubernetes cluster

All my server are part of a k3s cluster which has been setuped with the following configuration (Ansible in-comming) : 

- HaProxy and Keepalived on each Master with IP on 192.168.1.100
- Deployed with ingress-nginx as a replacement of traefik
- Deployed with metallb as a replacement of servicelb
- Deployed with ETCD instead of Kine, for the moment, i do not want to handle a specific database engine for my Kubernetes cluster such as MariaDB / PostgreSQL. Kine with sqlite can't be deployed in HA.

System application are deployed using the k3s helmConfig which include : 

- ArgoCD
- MetalLB
- Ingress-Nginx
- LongHorn

All other applications are or will be deployed using ArgoCD.

## My Vault Configuration

My Vault server is deployed using Raft backend with Helm over ArgoCD.

Vault is configured with Terraform.

All my secret are stored on Vault, i'm using the mutating webhook from bank-vault to inject those secret directly inside my pods.

## Access from the Outside

Actually all my service are registered on Scaleway DNS for private and public network.

Private Network is only accessible from my Homelab, in the future a Headscale configuration is going to be deployed to allow access from my secure device

Public Network is available from outside only on port 443 to specific URL that are designed to be publically accessed such as a future portfolio for example.