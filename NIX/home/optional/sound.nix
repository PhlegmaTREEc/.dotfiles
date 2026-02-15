{ config, pkgs, inputs, lib, ... }:

{
  services.easyeffects = {
    enable = true;
    };
  home.file = {
    ".config/easyeffects" = {
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/easyeffects";
      }; 
    };
}
