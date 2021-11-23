#!/bin/bash

if [[ "$OSTYPE" = "linux"* ]] ; then
	ESPANSO_CONF=$XDG_CONFIG_HOME/espanso/default.yml
elif [[ "$OSTYPE" = "darwin"* ]] ; then
	ESPANSO_CONF=$HOME/Library/Preferences/espanso/default.yml
fi

printf "%s %s\n" "Encrypting conf at:" $ESPANSO_CONF

ansible-vault encrypt $ESPANSO_CONF --output ./.espanso/default.yml
