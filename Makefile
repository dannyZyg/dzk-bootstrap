SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

docker-build: ## Build the arch docker container
	docker build -t arch .

docker-run: ## Enter the arch docker container
	docker run -it --rm arch bash

all: ## Run the full ansible playbook
	ansible-playbook local.yml --ask-vault-pass --ask-become-pass

node: ## Install Node, N and npm packages
	ansible-playbook local.yml -t node --ask-become-pass

vim: ## Install vim and plugins
	ansible-playbook local.yml -t nvim --ask-become-pass
