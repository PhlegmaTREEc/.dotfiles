{ config, pkgs-st, nixvm-one, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  home-manager.users.ptclab = import ../../home/lab/home.nix;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      systemd-boot.configurationLimit = 15;
      timeout = 2;
    };
  };

  services.openssh = {
    enable = true;
  };

  networking = {
    firewall = {
      enable = false;
      };
    hostName = "${nixvm-one}";
  };

  programs.zsh.enable = true;

  users = {
    users.ptclab = {
      initialPassword = "pass";
      isNormalUser = true;
      extraGroups = [ "wheel"];
      useDefaultShell = true;
    };
    defaultUserShell = pkgs-st.zsh;
  };

  environment.systemPackages = with pkgs-st; [
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
