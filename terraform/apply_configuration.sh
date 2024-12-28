#!/bin/bash
# Apply Terraform configuration
echo "Applying Terraform configuration..."
terraform apply -auto-approve

# Extract outputs from Terraform in JSON format
echo "Extracting Terraform outputs..."
OUTPUT_JSON=$(terraform output -json)

ANSIBLE_USER=$(echo "$OUTPUT_JSON" | jq -r '.vm_user.value')
UPMON_URL=$(echo "$OUTPUT_JSON" | jq -r 'vr.upmon_url.value')

# Extract IP addresses
IP1=$(echo "$OUTPUT_JSON" | jq -r '.webserver_ips.value[0]')
IP2=$(echo "$OUTPUT_JSON" | jq -r '.webserver_ips.value[1]')
DB_HOST=$(echo "$OUTPUT_JSON" | jq -r '.db_host.value')

# Extract sensitive data
DB_USERNAME=$(echo "$OUTPUT_JSON" | jq -r '.db_username.value')
DB_NAME=$(echo "$OUTPUT_JSON" | jq -r '.db_name.value')
DB_PASSWORD=$(echo "$OUTPUT_JSON" | jq -r '.db_password.value')
DB_DATABASE=$(echo "$OUTPUT_JSON" | jq -r '.db_database.value')


# Create or overwrite the inventory.ini file
echo "Creating inventory.ini file..."
cat << EOF > ../ansible/inventory.ini
[webservers]
webserver1 ansible_host=$IP1 
webserver2 ansible_host=$IP2 

[all:vars]
ansible_user=$ANSIBLE_USER

db_host=$DB_HOST
db_username=$DB_USERNAME
db_name=$DB_NAME
db_password=$DB_PASSWORD
db_port=6432
upmon_url=$UPMON_URL
EOF

# Confirmation message
echo "Inventory.ini created successfully."

