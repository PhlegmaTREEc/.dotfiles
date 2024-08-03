# My dotfiles made for NixOS using flakes

- Modular config in progress

## Desktop

- Hyprland is the centrepiece

### Installation

#### Partitions 

- sudo fdisk /dev/xxx
- "g" for GPT 
- "n" for new partition
- enter twice
- +1024M for 1Gb partition
- "n" and enter three time
- "w" to write changes
- result lsblk (-fp) should show two partitions 1Gb + the rest

#### Format

- sudo mkfs.vfat -n BOOT /dev/xxx
  - boot partition with BOOT labet
- sudo mkfs.btrfs -L BASE /dev/xxx
  - btrfs partion with BASE label

#### Subvolumes

- sudo mount /dev/xxx2 /mnt
- btrfs Subvolumes create /mnt/nix
- ... /etc /log /root /home
- sudo umount /mnt
- ...more TBD

### Sources

- [link1](https://cnx.gdn/blog/butter/)
- [link2](https://mt-caret.github.io/blog/posts/2020-06-29-optin-state.html)

## Homelab

### OPNSense

- how to AdGuard
- [link1](https://0x2142.com/how-to-set-up-adguard-on-opnsense/?utm_source=YouTube&utm_campaign=opnadguard)
- [link2](https://windgate.net/setup-adguard-home-opnsense-adblocker/)

## NON Nixos Notes

## Rclone

- proton drive guide is [here](https://rclone.org/protondrive/)
- command used is `rclone mount proton: /home/ptc/ProtonDrive --vfs-cache-mode full`
- just create the folder `mkdir /home/ptc/ProtonDrive`

### Dygma Notes

#### Manual flash

- [link](https://github.com/Dygmalab/Bazecor/issues/643#issuecomment-1884763670)

### Changing device name for wireplubmer

- Arch [wiki](https://wiki.archlinux.org/title/WirePlumber) link - 2.4
- For multiple devices to be renamed, make multiple files
  - name files as needed (51-XXX.lua; 52-YYY.lua; ...)

### XP-Pen-Tablet

- aur package and manual download (.tar.gz package) both install fine
- To make it actually work change to .desktop file has to be made
  - Exec=env QT_QPA_PLATFORM=xcb /usr/lib/pentablet/pentablet.sh

### Separating front and back audio jack

- [link](https://discussion.fedoraproject.org/t/how-can-i-disable-front-panel-jack-detection/80957/4)
- turning off auto detection seems to do the trick
