### Hexlet tests and linter status:
[![Actions Status](https://github.com/Alexander951/devops-for-programmers-project-77/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Alexander951/devops-for-programmers-project-77/actions)

[![Upmon Status](https://www.upmon.com/badge/13f88b50-948c-4e00-bc1f-29ec08/07Xy0mSI-2.svg)](https://www.upmon.com/projects/f88d97d9-f4d9-4d01-9300-d22d9b771030/checks/)

[Demo site](https://hexlet.web-programmer.kz/)

## Requirements
- Terraform
- Ansible
- Make
- jq

## Usage
Add `.password` file whith password to root folder
The `ansible/group_vars/all/vault.yml` file contains the credentials for the infrastructure: 
- db_password
- yc_token
- yc_cloud_id
- yc_folder_id
- datadog_api_key
- datadog_app_key
- upmon_url
- admin_ssh_key
- certificate_ids



```
$ make create-vault  # Creating an encrypted file.
```
```
$ make edit-vault  # Editing an encrypted file.
```
```
$ make prepare-terraform  # Copy variables in Terraform.
```
```
$ make init  # initialize Terraform and Ansible.
```
```
$ make login-tf  # login Terraform
```
```
$ make apply-tf  # initialize (terraform) the cloud environment
```
```
$ make create-config  # Export value from Terraform structure to Ansible
```
```
$ make destroy-tf  # destroy structure
```
```
$ make install-docker  # (ansible) install docker 
```
```
$ make deploy  # (ansible) deploy Redmine 
```
```
$ make monitoring  # install monitoring for Datadog, Upmon 
```


