# My ansible Lab setup automated
>using vagrant, vitualbox and ansible

## Ansible master
> Could be you own laptop, with some amount of ram. 

### 1 - Install dependencies (VirtualBox, Vagrant, Ansible)
> Only testet on Linux
1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Download and install [vagrant](https://www.vagrantup.com/downloads).
3. Install ansible (debian base)
   - `sudo apt update && sudo apt install python3-pip`
   - `sudo pip3 install ansible` install globally, read more on [docs.ansible.com](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).


## Vagrant host in this lab.**
*** Home test setup
* docker01 (ubuntu 20.04 server, with docker and some containers)
* srv01 (ubuntu 20.04 server)
* srv02 (ubuntu 20.04 server)
* roc8
* alma8
* ora8
* ora7
* deb11
* deb10
* ubt2110 (ubuntu 21.10 server)

### 2 - Build the Virtual Machine
* Download this project and put it wherever you want.
* Open Terminal, cd to this directory.
* ! Run `ansible-playbook playbooks/create-lab-ssh-key.yml` once, to create the local ssh keys used for this lab(labadmin, deploy, pi). 
* ! On first run `ansible-galaxy install -r requirements.yml` to download role requirements
* ! run `ansible-playbook playbooks/inventory-to-hostfile.yml -K and provide localhost sudo password` once, to get vagrant host in local /etc/hosts 

* use Vagrant to start stop hosts.
  * **up/start**
    * `vagrant up HOSTNAME` eg. `vagrant up pi01.test` single host
    * `vagrant up HOSTNAME` eg. `vagrant up pi01.test pi02.test` multiple hosts
  * **halt/stop**
    * `vagrant halt HOSTNAME` to stop single host
    * `vagrant halt HOSTNAME1 HOSTNAME2` to stop multiple hosts
    * `vagrant halt` to stop all hosts
  * **dastroy/remove**
    * `vagrant destroy HOSTNAME -f` to remove single host
    * `vagrant destroy HOSTNAME1 HOSTNAME2 -f` to remove multiple host
    * `vagrant destroy -f` to remove all hosts

### 3 - My basic ansible setup 
* Create 'labadmin'/'deploy'/'pi' ssh keys on ansible master in ~/.ssh/labadmin (Only use this in lab)
* Update os cache
* Cerate 'Lab Admin'/'deploy'/'pi' users and 'Wheel' group
  - copy files/.bash_aliases to new users 
* setup of basic security, firewall, ntp(danish)
* roles from others that i use. 
  - geerlingguy.security (Secure ssh)
  - geerlingguy.firewall defined pr host in host_vars
    - default (port 22, 80, 443) pi01 and pi02 dont have filrewall. 
  - geerlingguy.ntp (Danish - Europe/Copenhagen)
  - geerlingguy.pip
* Upgrade os
* Install basic packages 
  - apt-transport-https
  - ca-certificates
  - curl
  - nano
  - htop
  - unzip
  - git
  - python3
  - python3-pip

### 4 - Ansible inventory and Adhoc commands.
> Vagrant name eg. pi01 ansible host is pi01.test (with domain)
* read more about adhoc at [docs.ansible.com](https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html)
* ping single host `ansible pi01.test -m ping`
* ping selected hosts `ansible "pi01.test,pi02.test" -m ping `
* ping all hosts `ansible all -m ping`
* get free memory on host `ansible pi01.test -m shell -a 'free -m'`
* reboot a host `ansible pi01.test -m shell -a 'sudo reboot -h now'`
* get host uptime `ansible pi01.test -m shell -a 'uptime'`









