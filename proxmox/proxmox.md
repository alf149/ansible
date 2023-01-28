
# All commands will be executed on a Proxmox host
apt update -y && apt install libguestfs-tools -y
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Install qemu-guest-agent on the image. Additional packages can be specified by separating with a comma.
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

# Finally, update all packages in the image.
virt-customize -a jammy-server-cloudimg-amd64.img --update

# Next, we create a Proxmox VM template.
# Change values for your bridge and storage and change defaults to your liking.
qm create 777 --name "ubuntu-20.04-template" --memory 1024 --cores 1 --net0 virtio,bridge=vmbr0
qm importdisk 777 jammy-server-cloudimg-amd64.img local-lvm
qm set 777 --scsihw virtio-scsi-pci --scsi0 local-lvm:vm-777-disk-0
qm set 777 --boot c --bootdisk scsi0
qm set 777 --ide2 local-lvm:cloudinit
qm set 777 --serial0 socket --vga serial0
qm set 777 --agent enabled=1
qm template 777

# Now we can create new VMs by cloning this template or reference it with Terraform Proxmox etc.
# Login with SSH only possible with user "ubuntu" and SSH keys specified in cloudinit image.

### Local ssh config 
host pve
    Hostname 192.168.0.100
    User root
    IdentityFile ~/.ssh/key