{ config, pkgs-st, ... }:

{
  home = {
    username = "ptclab";
    homeDirectory = "/home/ptclab";
    enableNixpkgsReleaseCheck = false;
  };

  home.stateVersion = "23.11"; # Please read the comment before changing.

  imports = 
    [
      ../core/default.nix
    ];

  programs.home-manager.enable = true;
}
