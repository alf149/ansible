## Just file
@help:
  cat justfile

## Ansible stuff
# optionally use --force to force reinstall all requirements
ansi_reqs:
  ansible-galaxy install -r requirements.yml --force 

ansi_env:
  echo 'Use localhost password'
  ansible-playbook playbooks/inventory_update.yml -K

ansi_hw HOST *TAGS:
  ansible-playbook playbooks/servers_lan_hw.yml --limit {{HOST}} {{TAGS}}

ansi_prod HOST *TAGS:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} {{TAGS}}

ansi_prod_first HOST:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} -i hosts_first.ini -t system

ansi_prod_upd HOST:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} --tags os_update --extra-vars "enable_os_update=true"

ansi_prod_upd_all:
  @echo 'OS update Start'
  ansible-playbook playbooks/servers_lan.yml --tags os_update --extra-vars "enable_os_update=true"
  @echo 'OS update Done'
  
ansi_prod_piupdate:
  ansible-playbook playbooks/servers_lan.yml --tags piholeupdate --extra-vars "enable_pihole_update=true"

ansi_prod_reboot:
  ansible-playbook playbooks/servers_lan_reboot.yml

ansi_test HOST *TAGS:
  ansible-playbook playbooks/servers_test.yml 

## Docker 


## Vagrant stuff
v_up HOST *ARGS:
  vagrant up {{HOST}} {{ARGS}}

v_stop HOST:
  vagrant halt {{HOST}}

v_del HOST:
  vagrant destroy {{HOST}}

v_status:
  vagrant status

v_boxupd:
  vagrant box update

## Other

hosts:
  batcat /etc/hosts | grep lan

sshconf:
  batcat ~/.ssh/config