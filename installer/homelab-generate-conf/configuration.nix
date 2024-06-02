{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
  };

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  
  users.users.ptclab = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "password";
  };

  services.cloud-init.network.enable = true;
  
  time.timeZone = "Europe/Prague";
  
  networking = {
    hostname = "fvtt-vm"
  };

  system.stateVersion = "23.11";
}
