
login:
	terraform -chdir=terraform login; 
init:	
	terraform -chdir=terraform init
	
tf-validate:
	terraform -chdir=terraform validate	
	
plan:
	terraform -chdir=terraform plan
	
apply:
	terraform -chdir=terraform apply;
	
refresh:
	terraform -chdir=terraform refresh;	
	
output:
	terraform -chdir=terraform output;	

create-config:
	cd terraform && bash apply_configuration.sh
	
destroy:
	terraform -chdir=terraform destroy
	
install-requirements:
	ansible-galaxy install -r ansible/requirements.yml

install-docker:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini -t install-docker --vault-password-file .password -vvv
	
install-pkg:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini -t install --vault-password-file .password -vvv

deploy:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini -t deploy --vault-password-file .password -vvv	

install-datadog:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini -t install-datadog --vault-password-file .password	
	
upmon-monitor:
	ansible-playbook ansible/playbook.yml -i ansible/inventory.ini -t monitoring --vault-password-file .password
	
create-vault:
	ansible-vault encrypt ansible/group_vars/webservers/vault.yml
	
edit-vault:
	ansible-vault edit --vault-password-file .password ansible/group_vars/webservers/vault.yml
	
	
	
	
