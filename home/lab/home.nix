{ config, pkgs, ... }:

{
  home.username = "ptclab";
  home.homeDirectory = "/home/ptclab";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = 
    [
      ../core/default.nix
    ];

  nix = {
    package = pkgs.nix;
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      frequency = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  programs.home-manager.enable = true;
}
