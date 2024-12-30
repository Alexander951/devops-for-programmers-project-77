
login:
	terraform -chdir=terraform login; 
init:	
	terraform -chdir=terraform init
	
validate:
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
	
format_terraform:
	erraform -chdir=terraform fmt
