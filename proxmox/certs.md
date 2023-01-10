# wildcard cert from letsencrypt

## copy certs
Copy fullchain.pem to proxmox server
Copy privkey.pem to proxmox server

## On proxmox 
cp fullchain.pem /etc/pve/nodes/pve/pveproxy-ssl.pem
cp privkey.pem /etc/pve/nodes/pve/pveproxy-ssl.key
systemctl restart pveproxy.service 

## remember to edit local dns. 
eg. pve1.intra.domain.com = 192.168.0.200

Proxmoc is now acceceble on both ip with at cert varning, and on FQDM eg pve1.intra.domain.com 