# My ansible Lab setup automated
>using vagrant, vitualbox and ansible.

Just a playground for me, but is public. 

## Ansible master
> Could be you own laptop, with some amount of ram. 

## 1 - Install dependencies (libvirt, Vagrant, Ansible)
> Only testet on Linux
1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Download and install [vagrant](https://www.vagrantup.com/downloads).
3. Install ansible (debian base)
   - `sudo apt update && sudo apt install python3-pip`
   - `sudo pip3 install ansible` install globally, read more on [docs.ansible.com](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).


### Vagrant host in this lab.
>Home test setup 
* dev01.test (ubuntu 22.04 server)
* srv01v (ubuntu 22.04 server)
* srv02v (ubuntu 22.04 server)
* srv03v (ubuntu 22.04 server)


## 2 - Build the Virtual Machine
* Download this project and put it wherever you want.
* Open Terminal, cd to this directory.
* On first run `ansible-galaxy install -r requirements.yml` to download role requirements
* run `ansible-playbook playbooks/inventory_update.yml -K and provide localhost sudo password` once, to get vagrant host in local /etc/hosts AND to get vagrant host in local ~/.ssh/config 

* use Vagrant to start stop hosts.
  * **up/start**
    * `vagrant up HOSTNAME` eg. `vagrant up srv01.test` single host
    * `vagrant up HOSTNAME` eg. `vagrant up srv01.test srv02.test` multiple hosts
  * **halt/stop**
    * `vagrant halt HOSTNAME` to stop single host
    * `vagrant halt HOSTNAME1 HOSTNAME2` to stop multiple hosts
    * `vagrant halt` to stop all hosts
  * **dastroy/remove**
    * `vagrant destroy HOSTNAME -f` to remove single host
    * `vagrant destroy HOSTNAME1 HOSTNAME2 -f` to remove multiple host
    * `vagrant destroy -f` to remove all hosts

## 3 - My basic ansible setup 
* Cerate 'deploy' user part and sudo. 
  - copy files/.bash_aliases to new user 
* setup of basic security, sshm firewall

## 4 - Ansible inventory and Adhoc commands.
> Vagrant name eg. srv01.test ansible host is srv01.test (with domain)
* read more about adhoc at [docs.ansible.com](https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html)
* ping single host `ansible srv01.test -m ping`
* ping selected hosts `ansible "srv01.test,pi02.test" -m ping `
* ping all hosts `ansible all -m ping`
* get free memory on host `ansible srv01.test -m shell -a 'free -m'`
* reboot a host `ansible srv01.test -m shell -a 'sudo reboot -h now'`
* get host uptime `ansible srv01.test -m shell -a 'uptime'`

## extent Disk 
Use Gui to extent disk in proxmox. 
Run : sudo growpart -v /dev/sda 1
run: sudo resize2fs /dev/sda 1
df -h to show free

## new docker service
Ad local cname dns in pi-hole (wait for sync til pi2 eg. 5 min)
Ad ufw roule allow from caddy to docker on port
ad ufw roule allow from caddy to docker on port
ad service to docker, ansible vars docker host
ad service to caddyfile in role. 







