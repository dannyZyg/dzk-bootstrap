#!/bin/bash

if [[ "$OSTYPE" = "linux"* ]] ; then
	ESPANSO_CONF=$XDG_CONFIG_HOME/espanso/default.yml
elif [[ "$OSTYPE" = "darwin"* ]] ; then
	ESPANSO_CONF=$HOME/Library/Preferences/espanso/default.yml
fi

ansible-vault encrypt $ESPANSO_CONF --output ./.espanso/default.yml
