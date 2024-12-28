
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


	
	
	
	
