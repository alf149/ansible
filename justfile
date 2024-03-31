recipe-name:
  echo 'This is a recipe!'

# this is a comment
another-recipe:
  @echo 'This is another recipe.'

## repo stuff
# optionally use --force to force reinstall all requirements
reqs *FORCE:
	ansible-galaxy install -r requirements.yml {{FORCE}}

ahw HOST *TAGS:
  ansible-playbook ansible/servers_lan_hw.yml --limit {{HOST}} {{TAGS}}

alan HOST *TAGS:
  ansible-playbook ansible/servers_lan.yml  --limit {{HOST}} {{TAGS}}

atest HOST *TAGS:
  ansible-playbook ansible/servers_test.yml  --limit {{HOST}} {{TAGS}}

aenv HOST *TAGS:
  ansible-playbook ansible/inventory_update.yml -K
