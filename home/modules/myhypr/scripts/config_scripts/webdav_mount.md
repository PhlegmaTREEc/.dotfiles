# This example is used for Moltenhosting access

## Sources:

- https://www.youtube.com/watch?v=uvdSExZLjcg
- https://wiki.archlinux.org/title/Davfs2

## Commands

- sudo paru -S davfs2
- sudo groupadd davfs2
- sudo usermod -aG davfs ptc
- mkdir /mnt/moltenhostin
- sudo chmod ug=rwx /mnt/moltenhosting
- sudo nvim /etc/davfs2/secrets
	- add : link username password
- sudo nvim /etc/fstab
	- add this: https://linkformmoltenhosting /mnt/moltenhosting davfs user,rw,noauto 0 0
- systemctl daemon-reload
- sudo mount /mnt/moltenhosting

# For Hetzner

- mkdir /mnt/HetznerSB
- sudo nvim /etc/fstab
	- add this: https://linkfromhetzner /mnt/HetznerSB davfs rw,user,uid=1000,auto, 0 0
- sudo nvim /etc/davfs2/secrets
	- add : link username password
- systemctl daemon-reload
