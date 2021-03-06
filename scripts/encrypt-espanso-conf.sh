#!/bin/bash

VAULT_ID=espanso

if [[ "$OSTYPE" = "linux"* ]] ; then
	ESPANSO_DIR=$XDG_CONFIG_HOME/espanso
elif [[ "$OSTYPE" = "darwin"* ]] ; then
	ESPANSO_DIR=$HOME/Library/Preferences/espanso
else
	printf "%s\n" "This system is not supported yet..." && exit
fi

cp -r $ESPANSO_DIR .

ansible-vault encrypt --vault-id $VAULT_ID@prompt espanso/match/* espanso/config/*
