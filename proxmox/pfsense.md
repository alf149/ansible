# PFsense

## allow ssh on WAN Only in homelab
easyrule pass wan tcp any any 22

### SSH client config
host pf
    HostName 192.168.0.24
    User root
    Port 22
    IdentityFile ~/.ssh/key


## allow ssh on WAN Only in homelab
easyrule pass wan tcp any any 80
easyrule pass wan tcp any any 443

## allow ICMP on WAN 
easyrule pass wan ICMP any any