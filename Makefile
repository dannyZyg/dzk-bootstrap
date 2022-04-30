SHELL := /bin/bash
.POSIX:
# .PHONY: help

help: ## Show this help
	@egrep -h '\s##\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

docker-build: ## Build the arch docker container
	docker build -t arch .

docker-run: ## Enter the arch docker container
	docker run -it --rm -u danny arch bash

docker-reload:
	make docker-build && make docker-run

docker-refresh:
	docker build --no-cache -t arch . && make docker-run

all: ## Run the full ansible playbook
	ansible-playbook local.yml --ask-vault-pass --ask-become-pass

zsh: ## Install zsh
	ansible-playbook local.yml -t zsh --ask-become-pass

node: ## Install Node, N and a version of node with N
	ansible-playbook local.yml -t node --ask-become-pass

npm: ## Install npm packages
	ansible-playbook local.yml -t npm

node-npm: ## Install Node, N and npm packages
	ansible-playbook local.yml -t node,npm --ask-become-pass

vim: ## Install vim and plugins
	ansible-playbook local.yml -t nvim --ask-become-pass

ssh: ## Install ssh key
	ansible-playbook local.yml -t ssh --ask-vault-pass --ask-become-pass

espanso-unpack: ## Decrypt espanso repo files into the config path
	ansible-playbook local.yml -t espanso --ask-vault-pass

espanso-pack: ## Encrypt the system espanso files - overwrites repo files
	./scripts/encrypt-espanso-conf.sh

debug: ## Print out env vars
	ansible-playbook local.yml -t debug

pacman-dump: ## Saves installed pacman packages to txt
	pacman -Qen | cut -d ' ' -f1 > packages/pacman.txt

pacman-aur-dump: ## Saves installed aur packages to txt
	pacman -Qetm | cut -d ' ' -f1 > packages/aur.txt

pull-repos: ## Pulls my github repos
	ansible-playbook local.yml -t repos
