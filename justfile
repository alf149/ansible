recipe-name:
  echo 'This is a recipe!'

## Vagrant stuff
v_up HOST:
  vagrant up {{HOST}}

v_stop HOST:
  vagrant halt {{HOST}}

v_status:
  vagrant status

v_boxupd:
  vagrant box update

## Ansible stuff
# optionally use --force to force reinstall all requirements
ansi_reqs *FORCE:
  ansible-galaxy install -r requirements.yml {{FORCE}}

ansi_env:
  ansible-playbook playbooks/inventory_update.yml -K

ansi_hw HOST *TAGS:
  ansible-playbook playbooks/servers_lan_hw.yml --limit {{HOST}} {{TAGS}}

ansi_prod HOST *TAGS:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} {{TAGS}}

ansi_prod_upd HOST:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} --tags os_update --extra-vars "enable_os_update=true"

ansi_prod_piupdate HOST:
  echo 'Ansible-Playbook on PROD VM's'
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} --tags piholeupdate --extra-vars "enable_pihole_update=true"

ansi_test HOST *TAGS:
  ansible-playbook playbooks/servers_test.yml  --limit {{HOST}} {{TAGS}}

