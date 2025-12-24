# My dotfiles

## Random notes

### SSH

- [github tutorial](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
  -``ssh-add ~/.ssh/id_ed25519`` should help with caching
- If you currently have password-based access to a server, you can copy your public key to it by issuing this command: ``ssh-copy-id remote_host``

### Rclone

- proton drive guide is [here](https://rclone.org/protondrive/)
- command used is `rclone mount proton: /home/ptc/ProtonDrive --vfs-cache-mode full`
- just create the folder `mkdir /home/ptc/ProtonDrive`

### Distrobox

- to enable audio (Ubuntu) instal pipewire-pulse and wireplumber packages

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
