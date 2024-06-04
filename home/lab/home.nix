{ config, pkgs, ... }:

{
  home.username = "ptclab";
  home.homeDirectory = "/home/ptclab";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = 
    [
      ../core/default.nix
    ];

  programs.home-manager.enable = true;
}
