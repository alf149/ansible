recipe-name:
  echo 'This is a recipe!'

## repo stuff
# optionally use --force to force reinstall all requirements
reqs *FORCE:
	ansible-galaxy install -r requirements.yml {{FORCE}}

## Vagrant stuff
vup HOST:
  vagrant up {{HOST}}

vstop HOST:
  vagrant halt {{HOST}}

vstatus:
  vagrant status

vboxupd:
  vagrant box update

## Ansible stuff
ansihw HOST *TAGS:
  ansible-playbook playbooks/servers_lan_hw.yml --limit {{HOST}} {{TAGS}}

ansiprod HOST *TAGS:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} {{TAGS}}

ansiprodupd HOST:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} --tags os_update --extra-vars "enable_os_update=true"

ansiprodpiupd HOST:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} --tags piholeupdate --extra-vars "enable_pihole_update=true"

ansitest HOST *TAGS:
  ansible-playbook playbooks/servers_test.yml  --limit {{HOST}} {{TAGS}}

ansienv:
  ansible-playbook playbooks/inventory_update.yml -K
