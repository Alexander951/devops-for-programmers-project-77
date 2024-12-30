
install-requirements:
	ansible-galaxy install -r requirements.yml

install-docker:
	ansible-playbook playbook.yml -i inventory.ini -t install-docker --vault-password-file .password -vvv
	
install-pkg:
	ansible-playbook playbook.yml -i inventory.ini -t install --vault-password-file .password -vvv

deploy:
	ansible-playbook playbook.yml -i inventory.ini -t deploy --vault-password-file .password -vvv	

install-datadog:
	ansible-playbook playbook.yml -i inventory.ini -t install-datadog --vault-password-file .password	
	
upmon-monitor:
	ansible-playbook playbook.yml -i inventory.ini -t monitoring --vault-password-file .password
	
create-vault:
	ansible-vault encrypt group_vars/all/vault.yml
	
edit-vault:
	ansible-vault edit --vault-password-file ../.password group_vars/all/vault.yml
	
prepare-terraform:
	ansible-playbook terraform_vars.yml -i inventory.ini  --vault-password-file .password	
	
	
