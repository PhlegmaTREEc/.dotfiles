{ config, pkgs, lib, inputs, outputs, ... }:

{
  home = {
    username = "ptclab";
    homeDirectory = "/home/ptclab";
    enableNixpkgsReleaseCheck = false;
  };

  home.stateVersion = "24.05"; # Please read the comment before changing.

  #imports = [ "${inputs.targetrepo}/path/to/file.nix" ]
  
  imports = 
    [
      ../core/default.nix
    ];

  programs.home-manager.enable = true;
}
