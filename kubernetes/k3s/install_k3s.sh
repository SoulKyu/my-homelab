curl -sfL https://get.k3s.io | sh -

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --cluster-init --tls-san 192.168.1.103 --tls-san 192.168.1.102 --tls-san 192.168.1.101 --tls-san 192.168.1.100 --tls-san k3s.local.soulkyu.net --tls-san local.soulkyu.net --default-local-storage-path /var/lib/data --token my-big-token --https-listen-port 8443 --disable servicelb --disable traefik

curl -sfL https://get.k3s.io | K3S_URL=https://192.168.1.100:6443 K3S_TOKEN=my-big-token INSTALL_K3S_EXEC="server" sh -s - --tls-san 192.168.1.103 --tls-san 192.168.1.102 --tls-san 192.168.1.101 --tls-san 192.168.1.100 --tls-san k3s.local.soulkyu.net --tls-san local.soulkyu.net --default-local-storage-path /var/lib/data --token my-big-token --https-listen-port 8443 --disable servicelb --disable traefik
