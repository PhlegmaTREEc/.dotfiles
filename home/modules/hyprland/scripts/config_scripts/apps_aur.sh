#! /bin/bash

sudo pacman -Syu && paru -Syua
# System
paru -S qtile-extras \
	adw-gtk3 \
	davfs2 \
	f1multiviewer-bin \
	ironbar-git \
	mkinitcpio-openswap --noconfirm --needed \
	opentabletdriver \
	watershot \
	xp-pen-tablet
