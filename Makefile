SHELL := /bin/bash

ENV ?= envs/aws/staging

init:
	cd $(ENV) && terraform init

plan:
	cd $(ENV) && terraform plan -var="project=mc-demo" -var="public_key_path=$$HOME/.ssh/id_rsa.pub"

apply:
	cd $(ENV) && terraform apply -auto-approve -var="project=mc-demo" -var="public_key_path=$$HOME/.ssh/id_rsa.pub"

destroy:
	cd $(ENV) && terraform destroy -auto-approve -var="project=mc-demo" -var="public_key_path=$$HOME/.ssh/id_rsa.pub"

fmt:
	terraform fmt -recursive
