{ config, pkgs-stable, lib, ... }:

{
  imports =
    [
      ../../home/core/default.nix
    ];

  home-manager.users.ptclab = import ../../home/lab/home.nix

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
  };

  networking = {
    hostname = "fvtt-vm";
    };

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

  services.openssh.enable = true;

  programs = {
    zsh = {
      enable = true;
    };
  };

  # Define users
  users.users.ptclab = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
  };

  # Set timezone
  time.timeZone = "Europe/Prague";

  # system packages
  environment.systemPackages = with pkgs-stable; [
    vim
    git
    curl
  ];

  # docker
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
