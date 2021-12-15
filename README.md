
### DZK-BOOTSTRAP

My personal ansible playbook to get a system up and running from nothing. This is a work in progress...

Currently there is patchy support for both linux and mac.

Run `make` to list all install options.

```
all                 Run the full ansible playbook
debug               Print out env vars
docker-build        Build the arch docker container
docker-run          Enter the arch docker container
dotfiles            Install dotfiles
espanso-pack        Encrypt the system espanso files - overwrites repo files
espanso-unpack      Decrypt espanso repo files into the config path
help                Show this help
node                Install Node, N and a version of node with N
node-npm            Install Node, N and npm packages
npm                 Install npm packages
ssh                 Install ssh key
vim                 Install vim and plugins
zsh                 Install zsh
```

Run a specific option using `make all` for example.
