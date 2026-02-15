# WIP
these are the steps to set up nixos VM in Proxmox
heavily based on [cjlarose github](https://github.com/cjlarose/nixos-dev-env/blob/3285f8f05d5f259c47e1ddab3bf4e0e18686ac27/README.md)

## Steps

### Optional
- ssh into the vm with tmux

  - **BUT first:** change the password with `passwd` in proxmox console

  - `ssh nixos@ip`

### Install

- get my repo

  - `curl -L  https://github.com/PhlegmaTREEc/.dotfiles/tarball/main -o dotfiles.tar.gz`

  - `tar -zxvf dotfiles.tar.gz && cd *.dotfiles*`

- change hostname in the script

  - ```vim installer/vm/bootstrap.sh```

- run the script, but make sure that /dev/sda is correct (lsblk)
  
  - `sudo ./installer/vm/bootstrap.sh /dev/sda`

- and then just install and profit

  - `sudo nixos-install`

  - `sudo shutdown now`

### After install

- remove the CD drive in proxmox

- change BIOS to "OVMF"

- add EFI Disk

- shh back in `shh ptclab@ip`

- change password `passwd`

- clone the repo
 
  - for temp use

    - `git clone https://github.com/PhlegmaTREEc/.dotfiles.git && cd .dotfiles`

  - for long term use (with ssh)

    - do ssh key [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

    - `git config --global user.name ""`

    - `git config --global user.email ""`

    - `git clone git@github.com:PhlegmaTREEc/.dotfiles.git`

- run the update script

  - `./update.sh`
