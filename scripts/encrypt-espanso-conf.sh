#!/bin/bash

VAULT_ID=espanso

if [[ "$OSTYPE" = "linux"* ]] ; then
	ESPANSO_DIR=$XDG_CONFIG_HOME/espanso
elif [[ "$OSTYPE" = "darwin"* ]] ; then
	ESPANSO_DIR=$HOME/Library/Preferences/espanso
else
	printf "%s\n" "This system is not supported yet..." && exit
fi

ESPANSO_CONF=$ESPANSO_DIR/default.yml

cp -r $ESPANSO_DIR .

ansible-vault encrypt --vault-id $VAULT_ID@prompt espanso/default.yml espanso/user/*
