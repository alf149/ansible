## Just file
@help:
  cat justfile

## Ansible stuff
# optionally use --force to force reinstall all requirements
ansi_reqs:
  ansible-galaxy install -r playbooks/requirements.yml --force 

ansi_env:
  echo 'Use localhost password'
  ansible-playbook playbooks/inventory_update.yml -K -i inventory/prod.ini -i inventory/test.ini -i inventory/dev.ini -i inventory/hardware.ini --vault-password-file ~/.vault_pass

ansi_inv *VARS:
  echo 'Show Ansible inventory'
  ansible-inventory --vault-password-file ~/.vault_pass --graph {{VARS}}

ansi_hardware *TAGS:
  ansible-playbook playbooks/servers_hardware.yml -i inventory/hardware.ini {{TAGS}} 

ansi_prod HOST *TAGS:
  ansible-playbook playbooks/prod_servers_all.yml -i inventory/prod.ini --vault-password-file ~/.vault_pass --limit {{HOST}} {{TAGS}} 

ansi_prod_first HOST *TAGS:
  ansible-playbook playbooks/prod_servers_all.yml -i inventory/bootstrap.ini --vault-password-file ~/.vault_pass -t system --limit {{HOST}} {{TAGS}} 

ansi_prod_upd *TAGS:
  ansible-playbook playbooks/prod_servers_all.yml -i inventory/prod.ini --vault-password-file ~/.vault_pass --tags os_update --extra-vars "enable_os_update=true" {{TAGS}} 

ansi_prod_docker:
  ansible-playbook playbooks/prod_docker_servers.yml -i inventory/prod.ini --vault-password-file ~/.vault_pass  --limit="prod_docker_servers"

ansi_prod_piupdate *TAGS:
  ansible-playbook playbooks/prod_dns_servers.yml -i inventory/prod.ini --vault-password-file ~/.vault_pass -t piholeupdate,os_update  -e enable_pihole_update=true,enable_os_update=true  --limit="prod_dns_servers" {{TAGS}} 

ansi_prod_reboot HOST *TAGS:
  ansible-playbook playbooks/servers_prod_reboot.yml --vault-password-file ~/.vault_pass --limit {{HOST}} {{TAGS}} 

ansi_test HOST *TAGS:
  ansible-playbook playbooks/test_servers.yml -i inventory/test.ini --vault-password-file ~/.vault_pass --limit {{HOST}} {{TAGS}} 

ansi_dev HOST *TAGS:
  ansible-playbook playbooks/dev_servers.yml -i inventory/dev.ini --vault-password-file ~/.vault_pass --limit {{HOST}} {{TAGS}} 

## Docker tasks


## Vagrant tasks
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

## Other tasks

hosts:
  batcat /etc/hosts | grep lan

sshconf:
  batcat ~/.ssh/config