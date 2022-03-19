# My ansible Lab setup automated
>using vagrant, vitualbox and ansible

## Ansible master
> Could be you own laptop, with some amount of ram. 

## 1 - Install dependencies (VirtualBox, Vagrant, Ansible)
> Only testet on Linux
1. Download and install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
2. Download and install [vagrant](https://www.vagrantup.com/downloads).
3. Install ansible (debian base)
   - `sudo apt update && sudo apt install python3-pip`
   - `sudo pip3 install ansible` install globally, read more on [docs.ansible.com](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html).


### Vagrant host in this lab.
>Home test setup 
* docker01 (ubuntu 20.04 server, with docker and some containers)
* srv01 (ubuntu 20.04 server)
* srv02 (ubuntu 20.04 server)
>test server to test ansible roles
* roc8 (Rocky linux)
* alma8 (Alma Linux)
* ora8 (Oracle Linux 8)
* ora7 (Oracle Linux 7)
* deb11 (Debian 11)
* deb10 (Debian 10)
* ubt2110 (ubuntu 21.10 server)
* win2019 (Windows server 2019/2022)

## 2 - Build the Virtual Machine
* Download this project and put it wherever you want.
* Open Terminal, cd to this directory.
*  Run `ansible-playbook playbooks/create-lab-ssh-key.yml` once, to create the local ssh keys used for this lab(deploy).This does not work on Windows server. 
* On first run `ansible-galaxy install -r requirements.yml` to download role requirements
* run `ansible-playbook playbooks/inventory-to-hostfile.yml -K and provide localhost sudo password` once, to get vagrant host in local /etc/hosts 
* run `ansible-playbook playbooks/inventory-to-sshconfig.yml -K and provide localhost sudo password` once, to get vagrant host in local ~/.ssh/config 

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
* Cerate 'deploy' user part og wheel og sudo. 
  - copy files/.bash_aliases to new user 
* setup of basic security, ssh

## 4 - Ansible inventory and Adhoc commands.
> Vagrant name eg. srv01 ansible host is srv01.test (with domain)
* read more about adhoc at [docs.ansible.com](https://docs.ansible.com/ansible/latest/user_guide/intro_adhoc.html)
* ping single host `ansible srv01.test -m ping`
* ping selected hosts `ansible "srv01.test,pi02.test" -m ping `
* ping all hosts `ansible all -m ping`
* get free memory on host `ansible srv01.test -m shell -a 'free -m'`
* reboot a host `ansible srv01.test -m shell -a 'sudo reboot -h now'`
* get host uptime `ansible srv01.test -m shell -a 'uptime'`

## 5 - Ansible cmdb and Adhoc commands.









