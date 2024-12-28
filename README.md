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
Add `secret.auto.tfvars` file to "/terraform" folder. (For example "secret.auto.tfvars.example")

```
$ make login  # login terraform
```
```
$ make init  # initialize terraform
```
```
$ make plan  # build (terraform) the plan of cloud environment
```
```
$ make apply  # initialize (terraform) the cloud environment
```
```
$ make destroy  # destroy (terraform) the cloud environment
```
```
$ make create-config  # export required variables to confg file for App 
```
```
$ make install-requirements  # (ansible) setup requirements for roles 
```
```
$ make install-pkg  # (ansible) install pip, (.env) file
```
```
$ make install-docker  # (ansible) install docker 
```
```
$ make deploy  # (ansible) deploy Redmine 
```
```
$ make install-datadog  # (ansible) install and setup Datadog
```
```
$ make upmon-monitor  # (ansible) install and setup upmon
```
```
$ make create-vault  # (ansible) create secret vault file
```
```
$ make edit-vault   # (ansible) edit secret vault file
```

