prepare-terraform:
	make -C ansible prepare-terraform

init:
	make -C terraform init
	make -C ansible install-requirements
	
login-tf:
	make -C terraform login 

apply-tf:
	make -C terraform apply

create-config-tf:
	make -C terraform create-config
	
destroy-tf:
	make -C terraform destroy
	
install-docker:	
	make -C ansible install-docker
	make -C ansible install-pkg
	
deploy:
	make -C ansible deploy

monitoring:
	make -C ansible install-datadog
	make -C ansible upmon-monitor
	
create-vault:
	make -C ansible create-vault
	
edit-vault:
	make -C ansible edit-vault
	
	
	
