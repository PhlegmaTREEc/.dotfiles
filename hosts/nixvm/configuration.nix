{ config, pkgs, pkgs-unstable, lib, inputs, outputs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  home-manager.users.ptclab = import ../../home/lab/home.nix;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 15;
      timeout = 2;
    };
  };

  services = {
    openssh.enable = true;
    qemuGuest.enable = true;
  };

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
  };

  networking = {
    firewall = {
      enable = false;
    };
  };

  programs.zsh.enable = true;

  users = {
    users.ptclab = {
      initialPassword = "pass";
      isNormalUser = true;
      extraGroups = [ "wheel"];
      useDefaultShell = true;
    };
    defaultUserShell = pkgs.zsh;
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    curl
  ];
  
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  time.timeZone = "Europe/Prague";

  system.stateVersion = "24.05";
}
