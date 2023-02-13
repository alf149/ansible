
# All commands will be executed on a Proxmox host
apt update -y && apt install libguestfs-tools -y
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Install qemu-guest-agent on the image. Additional packages can be specified by separating with a comma.
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

# Finally, update all packages in the image.
virt-customize -a jammy-server-cloudimg-amd64.img --update
virt-customize -a jammy-server-cloudimg-amd64.img --install qemu-guest-agent

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


# Automated
File on PVE bash ./ubnt_tmpl.sh

```bash
#!/bin/bash

imageURL=https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
imageName="jammy-server-cloudimg-amd64.img"
volumeName="local-lvm"
virtualMachineId="9000"
templateName="jammy-tpl"
tmp_cores="1"
tmp_memory="1024"

rm *.img
wget -O $imageName $imageURL
qm destroy $virtualMachineId
virt-customize -a $imageName --install qemu-guest-agent
virt-customize -a $imageName --update
qm create $virtualMachineId --name $templateName --memory $tmp_memory --cores $tmp_cores --net0 virtio,bridge=vmbr0,tag=30
qm importdisk $virtualMachineId $imageName $volumeName
qm set $virtualMachineId --scsihw virtio-scsi-pci --scsi0 $volumeName:vm-$virtualMachineId-disk-0
qm set $virtualMachineId --boot c --bootdisk scsi0
qm set $virtualMachineId --ide2 $volumeName:cloudinit
qm set $virtualMachineId --serial0 socket --vga serial0
qm set $virtualMachineId --agent enabled=1
qm template $virtualMachineId

qm set $virtualMachineId --sshkey deploy.pub
qm set $virtualMachineId --ciuser deploy
qm set $virtualMachineId --cipassword password
qm set $virtualMachineId --nameserver 192.168.0.1
qm set $virtualMachineId --ipconfig0 ip=dhcp
qm set $virtualMachineId --searchdomain lan


```

# Clone VM template
qm clone 9000 201 --name srv201 --full
qm set 201 --ipconfig0 "ip=192.168.30.201/24,gw=192.168.30.1"

qm clone 9000 202 --name srv202 --full
qm set 202 --ipconfig0 "ip=192.168.30.201/24,gw=192.168.30.1"
