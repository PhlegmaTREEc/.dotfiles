{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    lazydocker
  ];

  #home.file = {
  #  ".config/lazydocker" = {
  #    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/home/dotconfig/lazydocker";
  #    }; 
}
