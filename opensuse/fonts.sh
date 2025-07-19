#!/usr/bin/env bash
cd ~
mkdir fonts
cd fonts
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/AdwaitaMono.zip"
unzip -a AdwaitaMono.zip JetBrainsMono.zip
sudo mkdir -p /usr/local/share/fonts
sudo mv *.{ttf,otf} /usr/local/share/fonts
cd ~
rm -r fonts
fc-cache
echo "fonts done"
