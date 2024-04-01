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
ahw HOST *TAGS:
  ansible-playbook playbooks/servers_lan_hw.yml --limit {{HOST}} {{TAGS}}

alan HOST *TAGS:
  ansible-playbook playbooks/servers_lan.yml  --limit {{HOST}} {{TAGS}}

atest HOST *TAGS:
  ansible-playbook playbooks/servers_test.yml  --limit {{HOST}} {{TAGS}}

aenv:
  ansible-playbook playbooks/inventory_update.yml -K
