# This folder containts all things nix from my time with that ... comlipcated beauty

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
