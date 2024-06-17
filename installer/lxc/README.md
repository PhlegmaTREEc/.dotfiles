# WIP

these are the steps to set up nixos LXC in Proxmox heavily based on [Michal Lynch](https://mtlynch.io/notes/nixos-proxmox/)
## Steps

### Set password

- in proxmox **host** machine go to console

  - `pct enter`

  - ` source /etc/set-environment`

  - `passwd`

### Set up

- set "configuration.nix"

  - `curl https://raw.githubusercontent.com/PhlegmaTREEc/.dotfiles/main/installer/lxc/configuration.nix | sudo tee /etc/nixos/configuration.nix`

- update

  - `nix-channel --update && sudo nixos-rebuild switch`

  - `sudo reboot`

### Full configuration

- get my repo

  - `git clone https://github.com/PhlegmaTREEc/.dotfiles.git && cd .dotfiles`

- run the update script

  - `
    ./update.sh`
