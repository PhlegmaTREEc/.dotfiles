{ config, pkgs, lab-user, fvtt-lxc-host, ... }:

{
  imports = [ <nixpkgs/nixos/modules/virtualisation/lxc-container.nix> ];

  networking = {
    hostName = "$(fvtt-lxc-host)";
    };

  environment.systemPackages = with pkgs; [
    curl
    git
    vim
  ];

  services.openssh.enable = true;

  # Define users
  users.users.$(lab-user) = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
    initialPassword = "pass";
  };

  # Supress systemd units that don't work because of LXC.
  # https://blog.xirion.net/posts/nixos-proxmox-lxc/#configurationnix-tweak
  systemd.suppressedSystemUnits = [
    "dev-mqueue.mount"
    "sys-kernel-debug.mount"
    "sys-fs-fuse-connections.mount"
  ];

  time.timeZone = "Europe/Prague";

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
  
  # docker
  virtualisation.docker.enable = true;

  system.stateVersion = "23.11";
}
