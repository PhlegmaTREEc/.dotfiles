{ config, pkgs, ... }:

{
  imports = [ <nixpkgs/nixos/modules/virtualisation/lxc-container.nix> ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 2;
    };
  };

  networking = {
    hostName = "fvtt-vm";
    };

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];

  services.openssh.enable = true;

  # Define users
  users.users.ptclab = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
    initialPassword = "password";
  };

  # Supress systemd units that don't work because of LXC.
  # https://blog.xirion.net/posts/nixos-proxmox-lxc/#configurationnix-tweak
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];

  time.timeZone = "Europe/Prague";

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # docker
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
